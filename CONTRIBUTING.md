# Corrections and contributions

This is a personal technical notebook. Small corrections are welcome.

For a mathematical issue, identify the post, statement, assumptions, and a source
or counterexample when possible. Distinguish a typo from a change to a claim or
proof. Do not reformat equations or code across unrelated posts.

For code or numerical results, include the input, environment, exact command,
observed behavior, and expected behavior. Do not replace results without recording
how they were reproduced.

Keep changes focused. Preserve existing URLs or add a tested compatibility route.
Run the source validator and production build/link checks described in README.
Follow the Markdown authoring guide below for new content, and explain intentional updates to
the preservation baseline in the same change. Never commit build output, local
dependencies, editor backups, credentials, or private datasets.

### Editing a preserved note

The 14 notes listed in `docs/content-preservation.json` have checksummed bodies,
so `tools/validate.rb` fails after any edit below their front matter, including
whitespace. After an intentional edit, record it in the same commit:

```bash
ruby tools/record-revision.rb --note "Fix the Hölder exponent range" _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md
```

The tool keeps the previous checksums and their commit in `revision_history` and
appends the dated note to `revision_note`. Front-matter edits need no record.

## Markdown authoring and preview

### Front matter belongs at the top

Keep one YAML block at the very beginning of the file, enclosed by two lines
containing exactly `---`. Write keys such as `note_type` and `series_order`
without backslashes. Do not replace the block with a Markdown table, a fenced
code block, or an HTML comment: Jekyll needs the YAML to read the title, URL,
categories, tags, and study-series metadata.

VS Code 1.121 introduced front matter tables in Markdown preview. This repository
uses `"markdown.preview.frontMatter": "hide"` in `.vscode/settings.json` to retain
the earlier preview behavior. It affects the preview of every Markdown file in
this workspace; it does not remove metadata or change the published blog.
Open the repository folder in VS Code for this workspace setting to apply.
To use the same behavior outside this repository, set **Markdown › Preview:
Front Matter** to **hide** in User Settings.

### A study note has three parts

1. **Metadata:** one YAML block with a stable `permalink`, honest `status`, and
   the appropriate `series` and `series_order`.
2. **Reading and writing:** source scope, prerequisites, coverage checklist,
   mathematical setup, definitions, results with hypotheses, proofs, examples,
   connections, and unresolved questions. Include only useful sections.
3. **Navigation:** previous and next notes at the end. Keep reading order distinct
   from prerequisite dependencies.

Use [the seminar template](templates/seminar-note.md) for a new seminar outline.
For numerical work, start with [the numerical-method template](templates/numerical-method.md).

- Use `## Heading`, with blank lines before and after it; do not write `**## Heading**`.
- Jekyll's post layout already prints the title. Start body sections at `##`
  to avoid repeating the title as a second page heading.
- Use `- [ ] Task` for unfinished work and `- [x] Task` only after completion.
- Preserve `status: outline` while the file is a plan. Change it to `working-note`
  when substantial reasoning is present; an empty section is not a completed proof.
- Keep statements, assumptions, and proof sketches distinct. Do not fill an empty
  section with an invented result or an experiment that has not been run.
- Use `$...$` and `$$...$$` for ordinary mathematics supported by both previews.
  Numbered equations and advanced TeX still need browser-side MathJax verification.
- Posts load MathJax by default. Tab, project, and other pages load it only with
  `math: true` in their front matter; the validator reports TeX on a page without it.
- Write plain TeX inside `$...$`, such as `$\|x\|_2$`, `$\{f_n\}$`, and `$|f_n|\le g$`,
  without Markdown escapes. The site's Markdown processor (`_plugins/notebook-markdown.rb`)
  passes each single-line `$...$` span to MathJax unchanged. Do not use `\(...\)` or
  `\[...\]`: kramdown removes those backslashes, and the validator rejects them.
- A paragraph containing only `[Correction required]` or `[Suggested addition]`,
  followed by a list, renders as a highlighted review note. Delete the whole block
  once the note is revised.
- Edit the Markdown source. Copying rendered HTML or a formatted preview back
  into the editor can turn metadata into tables or escape headings and links.

### Use the right preview

**VS Code Markdown preview** is a quick check for ordinary Markdown, code blocks,
and basic mathematics. It does not run Jekyll/Liquid, theme layouts, post metadata,
or the blog's full MathJax configuration. Therefore `{% link ... %}` and
`{% include ... %}` may remain visible as source. Keep these tags when they are
needed for stable site links or includes; do not escape or delete them to make
the editor preview look like the website.

**Jekyll preview** is the check for the published appearance, including metadata,
Liquid links, the contents sidebar, and series navigation:

```bash
bundle exec ruby tools/validate.rb
bundle exec jekyll serve --livereload
```

Open `http://127.0.0.1:4000`. The existing **Run Jekyll Server** VS Code task runs
the preview through `tools/run.sh`. Before publishing, run the production and
internal-link checks described in README.

References: [VS Code front matter preview options](https://code.visualstudio.com/updates/v1_121#_yaml-frontmatter-in-markdown-preview)
and [Jekyll front matter](https://jekyllrb.com/docs/front-matter/).
