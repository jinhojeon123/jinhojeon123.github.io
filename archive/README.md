# Preserved legacy files

These files were moved out of the active site during the repository audit on
2026-09-07. No archived file was rewritten or deleted. The original relative
directory structure is retained under `legacy/` so that provenance is clear.

The `archive` directory is excluded from the Jekyll build. It is still part of
the Git repository and is not a place for private information or secrets.

[manifest.json](manifest.json) records the original path, current path, byte
count, SHA256 checksum, and reason for every move. Checksums were compared before
and after moving all ten files and matched. They cover the original bytes,
including line endings and binary editor undo data.

| Original path | Archived path | Reason |
| --- | --- | --- |
| `git` | `legacy/git` | Empty stray file at the repository root. |
| `_posts/.placeholder` | `legacy/_posts/.placeholder` | Starter placeholder superseded by real posts. |
| `_posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md~` | `legacy/_posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md~` | Editor backup. The active post contains the same material plus four references. |
| `_posts/.2026-01-10-epsilon-optimal-cost-scaling-mcmf.md.un~` | `legacy/_posts/.2026-01-10-epsilon-optimal-cost-scaling-mcmf.md.un~` | Binary Vim undo history retained for recovery. |
| `_posts/seminar/YYYY-MM-DD-measure-theory-seminar-01.md` | `legacy/_posts/seminar/YYYY-MM-DD-measure-theory-seminar-01.md` | Front matter outline with a placeholder date and no body. |
| `_posts/seminar/YYYY-MM-DD-measure-theory-seminar-02.md` | `legacy/_posts/seminar/YYYY-MM-DD-measure-theory-seminar-02.md` | Empty undated seminar placeholder. |
| `_posts/sobolev-foundations/01-weak-derivatives.md` | `legacy/_posts/sobolev-foundations/01-weak-derivatives.md` | Undated equation fragment without front matter, preserved for a future note. |
| `workflows/pages.yml` | `legacy/workflows/pages.yml` | Inactive workflow outside `.github/workflows/`. |
| `sitemap.xml` | `legacy/sitemap.xml` | Posts-only manual sitemap superseded by the configured `jekyll-sitemap` plugin. |
| `robots.txt` | `legacy/robots.txt` | The production build found a duplicate destination with the theme's generated robots file; keep the theme's dynamic sitemap URL. |

The undated seminar outlines and Sobolev fragment were not valid dated Jekyll
posts. Archiving them does not remove a previously generated post URL. Existing
dated posts remain in `_posts/`; their mathematical content is preserved.

To resume an outline, copy it into a new dated post, supply real front matter,
and develop its content deliberately. Keep the archived original and checksum
as a record. Do not put an archived workflow back into service without reviewing
it against the maintained workflow in `.github/workflows/`.
