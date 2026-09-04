# Technical reference

This is the maintainer-facing doc: stack, local dev, deployment. For what
this project *is*, see [README.md](README.md). For how to write a new
chapter without touching any code, see [CONTRIBUTING.md](CONTRIBUTING.md).

## Repo layout

```
chapters/     curated source material and finding aids (archival, static)
site/         the public Astro site built from it
  src/
    content/chapters/*.md   chapters added after Chapter 1 (Markdown)
    content.config.ts       schema for those Markdown chapters
    pages/
      index.astro           homepage — lists Chapter 1 + any Markdown chapters
      chapters/eww.astro    Chapter 1, hand-built (see "Why is Chapter 1 special" below)
      chapters/[...slug].astro   renders any Markdown chapter
    layouts/BaseLayout.astro
    styles/global.css       the entire stylesheet — one file, plain CSS
```

## Stack

- **Astro** (static output, no framework — no React/Vue/etc.)
- **Plain CSS**, one file (`site/src/styles/global.css`), no Tailwind or
  CSS-in-JS. Design tokens (colors, fonts) are CSS custom properties at
  the top; both light and dark mode are handled there via
  `prefers-color-scheme`.
- **Google Fonts**: Spectral (headings/body serif), Source Sans 3 (UI
  sans), IBM Plex Mono (labels/code) — loaded via `@import` in
  `global.css`.
- **Astro content collections** for chapters written after Chapter 1 —
  plain Markdown files, schema-validated, auto-listed on the homepage.
  See `site/src/content.config.ts`.

## Local development

```
cd site
npm install
npm run dev       # localhost:4321
npm run build     # outputs to site/dist/
npm run preview   # serve the production build locally
```

## Why is Chapter 1 special?

`chapters/eww.astro` is hand-authored HTML/Astro, not a Markdown content
entry — it needed a richer layout (timeline, cast-of-characters grid,
pull-quote cards) that plain Markdown + the shared `.prose` styles don't
cover. Chapters added after it are expected to be plain Markdown in
`site/src/content/chapters/`, rendered through the generic
`.prose` styles in `global.css`. If a future chapter needs bespoke layout
again, follow the `eww.astro` pattern instead of fighting Markdown.

## Adding a chapter (technical notes)

Non-technical walkthrough: [CONTRIBUTING.md](CONTRIBUTING.md).

Schema (`site/src/content.config.ts`): `title`, `dek`, `dates`, `order`
(number, controls homepage sort), `draft` (boolean, hides from the
published site). New files go in `site/src/content/chapters/`, filenames
become the URL slug (`site/src/content/chapters/02-spivey.md` →
`/chapters/02-spivey/`). No other file needs to change — the homepage
loop and the `[...slug].astro` route both pick up new entries
automatically.

## Deployment

**Status: not yet finalized.** The repo currently ships a GitHub Pages
setup (below) as the default/working option. Cloudflare Pages is also on
the table and arguably the better long-term fit — see the comparison
below before treating GitHub Pages as the final answer.

### Current setup: GitHub Pages

- `.github/workflows/deploy-site.yml` builds `site/` via
  `withastro/action` and deploys with `actions/deploy-pages` on every
  push to `main` that touches `site/`.
- `astro.config.mjs` sets `base: '/vcu-early-computing/'` to match
  GitHub's project-page URL shape (`todde.github.io/vcu-early-computing/`).
  Every internal link in the site uses **relative** paths (`chapters/eww/`,
  `../../`) rather than root-absolute ones, specifically so this works
  without hardcoding the base everywhere. The favicon/og:image links in
  `BaseLayout.astro` use `import.meta.env.BASE_URL` for the same reason.
- One-time setup on GitHub's side: Settings → Pages → Source →
  "GitHub Actions" (already done for this repo when it was first pushed).

### Alternative: Cloudflare Pages

Advantages over the current setup:
- No Actions workflow to maintain — Cloudflare builds directly from the
  repo on push.
- A real subdomain (e.g. `vcucompute.hottoddie.com`) instead of a nested
  `github.io` path — better for sharing with non-technical people, and
  it means `base` can go back to `/` (root), which simplifies
  `astro.config.mjs` and removes the need for `BASE_URL` prefixing.
- Free preview URLs per branch/PR — useful once outside contributors
  (e.g. Michael Keller) start submitting chapters via PR instead of
  committing straight to `main`.

To switch:
1. In Cloudflare's dashboard, connect this GitHub repo as a Pages
   project. Build command `npm run build`, root directory `site`,
   output directory `dist`.
2. Change `astro.config.mjs`: drop `base` entirely (or set it to `/`),
   and update `site` to the real domain once chosen.
3. Point the chosen subdomain at Cloudflare Pages in DNS (trivial if the
   parent domain is already on Cloudflare).
4. Delete or disable `.github/workflows/deploy-site.yml` and turn off
   GitHub Pages in the repo settings, to avoid two systems building the
   same site.

## Favicon / social preview

`site/public/favicon.svg` + `vcu-favicon.ico` (browser tab icon),
`vcu-computing-icon.png` (used as `og:image` for link previews). All
referenced through `BASE_URL` in `BaseLayout.astro` — if the base path
changes (e.g. moving to Cloudflare root), these keep working without
edits.
