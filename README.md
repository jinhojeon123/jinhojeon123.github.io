# Mathematics & Scientific Computing Notebook

Source for [Jin Ho Jeon's technical notebook](https://jinhojeon123.github.io/).
The site connects mathematical foundations, numerical methods, iterative solvers,
parallel implementation, and research experiments. It is a study archive and
developing computational portfolio; project pages distinguish current evidence
from planned work.

## Stack

- Ruby 3.4 (`.ruby-version` pins the local/CI patch version).
- Jekyll 4 and Chirpy 7.4.1, with resolved versions in `Gemfile.lock`.
- Kramdown, MathJax 3.2.2, and Rouge for mathematical and code-heavy writing.
- GitHub Actions builds a static artifact and deploys it to GitHub Pages.
- No Node build or custom database is required. Theme libraries use their pinned
  CDN URLs; the optional `assets/lib` submodule is retained but disabled.

## Local development

Use Ruby 3.4 with Bundler. Windows users need RubyInstaller with MSYS2/Devkit for
native gems; the repository also provides a Ruby 3.4 development container.

```bash
bundle install
bundle exec ruby tools/validate.rb
bundle exec jekyll serve --livereload
```

Open `http://127.0.0.1:4000`. The development build intentionally uses a Bootstrap
CDN stylesheet; verify production assets before publishing.

Build and check production output on Linux/macOS/Git Bash:

```bash
bash tools/test.sh
```

Equivalent PowerShell commands:

```powershell
bundle exec ruby tools/validate.rb
bundle exec jekyll clean
$env:JEKYLL_ENV = 'production'
bundle exec jekyll build --trace
bundle exec htmlproofer _site --disable-external
Remove-Item Env:JEKYLL_ENV
```

`tools/run.sh` wraps the preview command; `--production` previews production asset
behavior. `tools/validate.rb` checks metadata, relations, historical URLs, and the
content-preservation records. HTMLProofer checks rendered internal links and images.
External references and browser-side TeX need separate review.

## Writing and organization

The six main navigation entries are **Home, Notes, Research, Projects, Papers,
About**. Category, tag, chronological, and measure-theory indexes remain available
under Notes, with their existing URLs preserved.

Use one subject category: **Mathematics**, **Numerical Methods**, **Solvers**, or
**Scientific Computing**. Tags identify specific topics; `note_type` describes
the format; `series` and `projects` connect a reading sequence. Research is a
purpose across subjects, rather than a competing category.

- Start with a [template](templates/) and the [contribution guide](CONTRIBUTING.md).
- Posts belong in `_posts/` or its subdirectories, use
  `YYYY-MM-DD-descriptive-kebab-case.md`, and include `layout: post`, `title`,
  `date`, `categories`, `tags`, `permalink`, `status`, and `note_type`.
- Use an explicit `/posts/descriptive-kebab-case/` permalink for new standalone
  notes. The study series retain their existing `/study/.../` permalinks even
  though their source files now live in `_posts/`.
- Templates start with `published: false`; replace placeholders before publishing.
- An existing unfinished post retains its URL with `status: outline`.
- The 79 study outlines are published posts: Folland Seminar (44), Linear Algebra
  Review (20), and Saad Study (15). Their dates record creation, not planned
  seminar dates; `series` and `series_order` define the reading sequence.
- Home and Notes link to each study series. Outlines also appear in the Notes
  outline lists, Categories, Tags, Archives, and search. Recent notes and the feed
  show developed notes; change `status` when an outline becomes a working note.
- Keep series metadata in `_data/study_series.yml` and ordered topic/prerequisite
  indexes in `study/`. Ordinary pages outside `_posts/` are not posts.
- Register project indexes under `_projects/` and use their `project_id` in a
  note's `projects` list. Project indexes collect linked notes and papers.
- Shared citation records live in `_data/references.yml`; existing manual
  reference lists remain valid.

## Directory structure

```text
_posts/                 Notes and published study outlines; explicit URLs retained
  folland-seminar/       44 seminar posts, Week 05–48, starting at Lp duality
  linear-algebra-review/ 20 prerequisite and bridge posts, units 00–19
  saad/                  15 numerical linear algebra posts, units 00–14
study/                  Series index pages and the Folland prerequisite checklist
STUDY-ROADMAP.md         Current actions and dependency navigation
STUDY-REVIEW.md          Section A/B/C decisions and outstanding corrections
study-review/           Detailed section decisions
_projects/              Persistent project indexes and evidence/status
_tabs/                  Five navigation pages (Home is index.html)
_data/                  Taxonomy, bibliography, contacts, legacy redirect mapping
_includes/, _layouts/   Small site-specific theme extensions
_plugins/               Git last-modified dates and taxonomy compatibility routes
assets/                 Profile image and notebook stylesheet
measure-theory/         Ordered series index
categories/, tags/      Existing subject indexes
archives/, start-here/  Existing navigation routes
templates/              Six reusable authoring templates; excluded from deployment
docs/                   Committed preservation and legacy URL manifests
archive/                Preserved historical files; excluded from deployment
tools/                  Preview, source validation, build and HTML checks
.github/workflows/      One PR validation and Pages deployment workflow
```

Chirpy's gem supplies the remaining layouts, styles, JavaScript, favicons, feed,
and robots file. `jekyll-sitemap` creates the sitemap. Theme-specific overrides are
kept in `_includes/`, `_layouts/`, and `_plugins/`; review these before upgrading
Chirpy. Keep `Gemfile.lock` committed. Do not commit `vendor/`, `_site*/`, local
runtime downloads, or validation scratch files.

## Deployment

In GitHub repository **Settings → Pages**, select **GitHub Actions** as the build
source. `.github/workflows/jekyll.yml` installs locked dependencies and validates
every pull request and push to `main`. Only a successful `main` build is uploaded
and deployed. A manual run is also available. No branch history rewrite or force
push is required.

The user-site configuration is `url: https://jinhojeon123.github.io` and
`baseurl: ""`. Custom plugins require the Actions build; GitHub's restricted
branch-based Jekyll build is not the supported deployment mode. If using a project
subpath, update `baseurl` and recheck the rendered links.

## Audit and preservation

- [Study roadmap](STUDY-ROADMAP.md): current work and dependency navigation.
- [Mathematical review](STUDY-REVIEW.md): pruning decisions and outstanding corrections.
- [Section decisions](study-review/section-decisions.md): detailed A/B/C classifications.
- [Content preservation](docs/content-preservation.json): body checksums and intentional revisions.
- [Legacy URLs](docs/legacy-urls.json): historical post addresses checked by validation.
- [Archive manifest](archive/README.md): original paths, reasons, and byte checksums.

The initial maintenance pass changed metadata only. The 2026-09-11 study review
prunes repetitive prose and adds local mathematical correction instructions;
new study posts contain headings and dependencies only. The 2026-09-12 correction
moved all 79 topics into `_posts/` and retained every `/study/.../` address. See
[the study roadmap](STUDY-ROADMAP.md) and [section review](STUDY-REVIEW.md).
Historical URL and body-hash manifests track intentional revisions.
An intentional future content correction must update its preservation record with
an explanation in the same change. Local audit notes under `docs/` are ignored;
the two linked JSON manifests are committed and used by CI.

## Contributions and license

Corrections are welcome; see [CONTRIBUTING](CONTRIBUTING.md). The original
[MIT LICENSE](LICENSE) and upstream copyright notice are retained. Chirpy's
existing post footer states CC BY 4.0; the audit records that separate inherited
notice. This cleanup does not choose or change the author's content license.
