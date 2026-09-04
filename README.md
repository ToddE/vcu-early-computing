# VCU Early Academic Computing

A research project documenting how VCU's College of Humanities and
Sciences began using computing in the classroom, from the last years
before the World Wide Web through the early web era. Assembled from
recovered DEC UNIX account backups, correspondence, source code, and
(eventually) interviews with the people who built this infrastructure.

This repository holds both the curated source material (`chapters/`)
and the public site built from it (`site/`, an Astro project deployed to
GitHub Pages via `.github/workflows/deploy-site.yml`). Only reviewed,
relevant material is kept here — see **Source material and privacy**
below.

## Site

The public site lives in `site/` (Astro, plain CSS, no framework). To
run it locally:

```
cd site
npm install
npm run dev
```

Pushes to `main` that touch `site/` auto-deploy to GitHub Pages.

## Chapters

### 01 — The Electronic Writers' Workshop (1990–1993)
`chapters/01-electronic-writers-workshop/`

How an undergraduate (A. Todd Emerson), English professors (Dr. Ann M.
Woodlief and Michael Keller), and campus computing staff (Gregory DeBruyn)
built SHARE — a menu-driven c-shell program letting students submit,
exchange, and comment on papers over VCU's networked DEC systems — and
formalized it into the copyrighted Electronic Writers' Workshop. Includes
a documented 1993 exchange with ACCS's Steven Saltzberg, who later
co-created Web Course in a Box and MadDuck Technologies — a possible
throughline from this project to VCU's later, more formal LMS efforts.

See `chapters/01-electronic-writers-workshop/Finding_Aid.md` for the
full item-level inventory, and `Artifacts/before-the-browser.html` for
the narrative writeup.

Worth noting: the correspondence in this chapter also documents `eng.poet`,
a department mailing list Michael Keller set up via VCU's system aliases
around the same time he was building SHARE — a small, separate example of
early email infrastructure in academic use at VCU, kept here for that
reason even though its subject (a poetry discussion group) isn't part of
the SHARE/EWW story itself.

### Future chapters (planned)
- An oral history / interview with **James Spivey**, founder of VCU's
  Academic Computing, on the founding and early direction of academic
  computing services at VCU.
- Additional chapters as further material and interviews are gathered.

New chapters after Chapter 1 are written as plain Markdown files in
`site/src/content/chapters/` and picked up automatically — no code
changes required. See [CONTRIBUTING.md](CONTRIBUTING.md) for the
step-by-step (editable entirely from github.com, no local setup needed).

## Source material and privacy

The raw, unfiltered DEC UNIX account backups this research draws from
are **not** stored in this repository at all. They live locally in a
sibling `ARCHIVE/` directory, outside this repo entirely, because they
contain substantial personal correspondence and coursework unrelated to
this project. Each chapter here contains only the material that was
reviewed and selected as relevant to the history of academic computing
at VCU.

## Status

Early-stage / actively growing. Chapter 1 (EWW) is the first complete
chapter as of August 2026.
