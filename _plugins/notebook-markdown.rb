# frozen_string_literal: true

require "strscan"

# Markdown processor for this notebook: Jekyll's kramdown (GFM input) with two
# additions. It is enabled by `markdown: NotebookKramdown` in _config.yml.
#
# 1. Inline TeX written as $...$ reaches MathJax exactly as written. kramdown
#    recognizes only $$...$$ as math, so it otherwise applies Markdown rules
#    inside single-dollar math: `$\|x\|$` loses its norm bars, `$\{f_n\}$`
#    loses its braces, `$f'$` gets a curly quote, and a paragraph containing
#    `$|f_n|\le g$` is parsed as a table row.
# 2. A paragraph containing only [Correction required] or [Suggested addition],
#    followed by a list, is rendered as a review callout (see notebook.css).
#
# tools/render-smoke.rb checks both behaviors.
module Notebook
  module InlineMath
    # Characters that kramdown's GFM parser unescapes after a backslash.
    ESCAPABLE = /[\\.*_+`<>()\[\]{}#!:|"'$=~-]/
    # Pandoc-style inline math on one line: no space after the opening $,
    # no space before the closing $, and no digit right after it ($5, $10).
    SPAN = /\$(?![\s$])((?:\\.|[^\\$\n])+?)(?<![\s\\])\$(?![$\d])/
    FENCE = /\A[ \t]*(`{3,}|~{3,})/
    INDENTED = /\A(?: {4}|\t)/
    LIST_ITEM = /\A\s*(?:[-*+]|\d+[.)])\s/
    # Block-level HTML whose content kramdown copies verbatim unless the tag
    # has a markdown attribute.
    RAW_HTML = /\A {0,3}<(pre|script|style|textarea|div|details|section|aside|figure|table|blockquote|p|ul|ol|dl|form|nav)\b([^>]*)>/i

    module_function

    # Backslash-escape every kramdown-significant character inside each $...$
    # span, so kramdown's output contains the original TeX. Fenced and indented
    # code, inline code, $$...$$ math, HTML comments, and raw HTML blocks are
    # left untouched.
    def protect(markdown)
      return markdown unless markdown.include?("$")

      state = { fence: nil, html: nil, depth: 0, display: false, comment: false, indented: false }
      previous_blank = true
      markdown.each_line.map do |line|
        output = protect_line(line, state, previous_blank)
        previous_blank = line.strip.empty?
        output
      end.join
    end

    def protect_line(line, state, previous_blank)
      return code_fence(line, state) if state[:fence]
      return raw_html(line, state) if state[:html]
      return protect_spans(line, state) if state[:display] || state[:comment]
      return code_fence(line, state) if line.match?(FENCE)

      if (match = RAW_HTML.match(line)) && !match[2].match?(/\bmarkdown\s*=/)
        state[:html] = match[1].downcase
        state[:depth] = 0
        return raw_html(line, state)
      end

      state[:indented] = indented_code?(line, state[:indented], previous_blank)
      state[:indented] ? line : protect_spans(line, state)
    end

    def indented_code?(line, continuing, previous_blank)
      return line.strip.empty? || line.match?(INDENTED) if continuing

      previous_blank && line.match?(INDENTED) && !line.match?(LIST_ITEM)
    end

    def code_fence(line, state)
      marker = line[FENCE, 1]
      if state[:fence].nil?
        state[:fence] = marker
      elsif marker && marker[0] == state[:fence][0] && marker.length >= state[:fence].length &&
            line.strip.delete(marker[0]).empty?
        state[:fence] = nil
      end
      line
    end

    def raw_html(line, state)
      tag = state[:html]
      state[:depth] += line.scan(/<#{tag}\b/i).length - line.scan(%r{</#{tag}\s*>}i).length
      state[:html] = nil if state[:depth] <= 0
      line
    end

    def protect_spans(line, state)
      scanner = StringScanner.new(line)
      output = +""
      until scanner.eos?
        if state[:display] || state[:comment]
          start = scanner.pos
          if scanner.skip_until(state[:display] ? /\$\$/ : /-->/)
            state[:display] = state[:comment] = false
          else
            scanner.terminate
          end
          output << line.byteslice(start...scanner.pos) # StringScanner positions are byte offsets
        elsif (escaped = scanner.scan(/\\./m))
          output << escaped
        elsif (ticks = scanner.scan(/`+/))
          output << ticks << (scanner.scan_until(/(?<!`)#{ticks}(?!`)/) || "")
        elsif scanner.scan(/\$\$/)
          state[:display] = true
          output << "$$"
        elsif output.strip.empty? && scanner.scan(/<!--/) # kramdown's block-level comments
          state[:comment] = true
          output << "<!--"
        elsif scanner.scan(SPAN)
          output << "$" << scanner[1].gsub(ESCAPABLE) { |char| "\\#{char}" } << "$"
        else
          output << scanner.getch
        end
      end
      output
    end
  end

  module ReviewNotes
    KINDS = { "Correction required" => "correction", "Suggested addition" => "suggestion" }.freeze
    LABEL = %r{<p>\[(Correction required|Suggested addition)\]</p>\s*(?=<ul>)}

    module_function

    def render(html)
      return html unless html.include?("<p>[")

      output = +""
      position = 0
      while (match = LABEL.match(html, position))
        output << html[position...match.begin(0)]
        finish = list_end(html, match.end(0))
        if finish
          label = match[1]
          output << %(<aside class="review-note review-note--#{KINDS.fetch(label)}" aria-label="Review note: #{label.downcase}">\n)
          output << %(<p class="review-note__label">#{label}</p>\n#{html[match.end(0)...finish]}\n</aside>)
          position = finish
        else
          output << match[0]
          position = match.end(0)
        end
      end
      output << html[position..]
    end

    # Character index just past the </ul> that closes the list starting at +from+.
    def list_end(html, from)
      depth = 0
      while (tag = html.match(%r{<(/?)ul\b[^>]*>}, from))
        depth += tag[1].empty? ? 1 : -1
        return tag.end(0) if depth.zero?

        from = tag.end(0)
      end
      nil
    end
  end
end

module Jekyll
  module Converters
    class Markdown
      class NotebookKramdown
        def initialize(config)
          @kramdown = KramdownParser.new(config)
        end

        def convert(content)
          Notebook::ReviewNotes.render(@kramdown.convert(Notebook::InlineMath.protect(content)))
        end
      end
    end
  end
end
