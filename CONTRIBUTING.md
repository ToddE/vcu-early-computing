# Adding a chapter

You don't need to install anything. This can all be done in the browser
on github.com.

1. Go to `site/src/content/chapters/` in this repository.
2. Click `_example.md` to see the template, or click **Add file → Create
   new file** to start a new one. Name it something like
   `02-founding-academic-computing.md`.
3. At the top, fill in the frontmatter block (the part between the `---`
   lines):

   ```
   ---
   title: Founding Academic Computing at VCU
   dek: An oral history with James Spivey on how it all began.
   dates: 1970s–1980s
   order: 2
   ---
   ```

4. Below the second `---`, write the chapter in plain Markdown:
   - Blank line between paragraphs
   - `## ` at the start of a line for a section heading
   - `**bold**` and `*italic*`
   - `> ` at the start of a line for a pulled quote

5. Scroll down, add a short commit message (e.g. "Add Spivey chapter"),
   and click **Commit changes directly to the `main` branch**.

That's it — the site rebuilds automatically and your new chapter appears
on the homepage within a couple of minutes. Nothing else needs to
change; you don't need to touch any of the `.astro` files.

If you'd rather write locally and paste it in, that works too — it's
just a Markdown file. Same commands you'd have used in `vi` (`:wq` to
save) apply if you clone the repo and edit it with a normal editor
instead of the GitHub web UI.
