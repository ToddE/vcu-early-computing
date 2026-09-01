---
title: How to write a chapter
dek: A short one-sentence description shown on the homepage card.
dates: 1990s
order: 99
draft: true
---

Delete this file's `draft: true` line (or delete the whole file) once
you're ready to publish. To add a new chapter, copy this file, rename it
something like `02-founding-academic-computing.md`, and edit the
frontmatter at the top plus the text below.

**Frontmatter fields:**

- `title` — the chapter's headline
- `dek` — a one-sentence description, shown on the homepage
- `dates` — a short date range, e.g. "1993–1996"
- `order` — a number controlling where it sits in the chapter list
  (lower numbers come first)
- `draft` — set to `true` to hide it from the published site while
  you're still working on it

**Writing the chapter:** everything below the `---` is plain Markdown.
Use `##` for section headings, blank lines between paragraphs, `**bold**`
and `*italic*` as usual, and `>` at the start of a line for a pulled
quote:

> Like this — a quoted line from a letter or an interview.

That's the whole format. No HTML needed.
