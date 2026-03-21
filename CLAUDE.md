# Distechnie

## Concept

**Distechnie** is a collection of dystopian short stories exploring the dark side of technology and its impact on society. Each story is a self-contained narrative (max ~40 pages), easy to read, set in a near-future world where technology has gone wrong in plausible, unsettling ways.

### Core Themes

Stories explore one or more of these themes:

- **Surveillance & Privacy** — omniscient systems, social scoring, loss of anonymity
- **Algorithmic Control** — AI decision-making over human lives, opaque systems, bias amplified
- **Digital Identity** — identity theft, deepfakes, loss of self in virtual worlds
- **Social Media & Manipulation** — addiction by design, opinion engineering, outrage economy
- **Transhumanism Gone Wrong** — body augmentation, mind uploading, loss of humanity
- **Automation & Obsolescence** — mass unemployment, purpose crisis, human devaluation
- **Corporate Dystopia** — megacorp governance, monetized existence, data as currency
- **Environmental Collapse via Tech** — geoengineering failures, techno-solutionism, synthetic ecosystems

### Tone & Style

- **Accessible**: written in clear, direct French prose — no jargon, no literary pretension
- **Grounded**: near-future settings, recognizable society, technology that feels 5-10 years away
- **Human-centered**: the story is always about people, not tech specs — emotions, dilemmas, moral grey areas
- **Twist-driven**: each story should have at least one moment that reframes everything
- **Short chapters**: 2-5 pages per chapter, punchy endings that pull the reader forward

## Site Architecture

### mdBook Static Site

- **Generator**: [mdBook](https://rust-lang.github.io/mdBook/) — a Rust tool designed for publishing books from Markdown
- **Deployment**: GitHub Pages via GitHub Actions (`.github/workflows/deploy.yml`)
- **URL**: https://gghez.github.io/distechnie/
- **Language**: French (content and UI)
- **Config**: `book.toml` — dark theme by default, smart punctuation, no section labels, search enabled

### Project Structure

```
distechnie/
├── book.toml                        # mdBook configuration
├── CLAUDE.md                        # Project guidelines (this file)
├── css/
│   └── custom.css                   # Custom styles (WIP banner, EPUB link, etc.)
├── scripts/
│   └── generate-epub.sh             # EPUB generation via pandoc
├── src/
│   ├── SUMMARY.md                   # Table of contents / navigation structure
│   ├── introduction.md              # Landing page
│   └── <story-slug>/
│       ├── index.md                 # Story overview (synopsis, links, WIP banner)
│       ├── chapitre-01.md           # Chapter 1
│       ├── chapitre-02.md           # Chapter 2
│       ├── ...
│       └── guidelines.md            # Creative guidelines for this story
└── .github/
    └── workflows/
        └── deploy.yml               # CI: EPUB generation + mdBook build + Pages deploy
```

### Navigation (SUMMARY.md)

`src/SUMMARY.md` controls the sidebar navigation. It must be updated manually when adding stories or chapters.

Structure pattern:
```markdown
# Summary

[Distechnie](introduction.md)

---

# Story Title

- [Présentation](<story-slug>/index.md)
  - [Chapitre 1 — Title](<story-slug>/chapitre-01.md)
  - [Chapitre 2 — Title](<story-slug>/chapitre-02.md)
  - ...
  - [Guidelines](<story-slug>/guidelines.md)
```

Key rules:
- Each story is a **part** (level-1 heading `# Story Title`)
- The story index is the top-level item, chapters are nested under it
- Guidelines page is listed last under the story
- Use `---` separators between stories
- Draft chapters can use `[Chapter Title]()` (empty link, renders as disabled)

## Story index.md Format

Each story's `index.md` contains (in order):
1. Story title as H1
2. WIP banner (HTML div, if the story is not complete)
3. EPUB download link (HTML div)
4. Guidelines link (HTML div)
5. Genre and synopsis

```markdown
# Story Title

<div class="wip-banner">En cours d'écriture — Cette nouvelle n'est pas encore terminée.</div>

<div class="epub-download">
  <a href="../epub/<story-slug>.epub" download>⬇ Télécharger en EPUB</a>
</div>

<div class="guidelines-link">
  <a href="guidelines.html">📄 Guidelines de création</a>
</div>

**Genre :** ...

**Résumé :** ...
```

When the story is complete, remove the `wip-banner` div.

## Chapter Format

Chapters are plain Markdown — no front matter, no shortcodes.

```markdown
# Chapitre N — Chapter Title

*Acte X — Act Title*

Chapter content...
```

- The H1 title is the chapter title
- Act subtitle in italics (if the story uses acts)
- Content follows directly

## Guidelines Page

Each story should have a `guidelines.md` containing the creative guidelines: concept, characters, plot structure, writing principles. This is the reference document for writing sessions with Claude Code.

- Listed in SUMMARY.md as the last entry under the story
- No front matter needed (mdBook doesn't use front matter)

## Naming Conventions

- Story directories: kebab-case (`le-dernier-developpeur`)
- Chapter files: `chapitre-NN.md` (zero-padded two digits)
- Story index: always `index.md` inside the story directory
- Guidelines file: always `guidelines.md` inside the story directory
- EPUB files: `<story-slug>.epub` (auto-generated in `book/epub/`, never committed)

## EPUB Generation

EPUBs are generated by `scripts/generate-epub.sh` using pandoc:

- Iterates over each story directory in `src/`
- Collects all `chapitre-*.md` files (sorted alphabetically)
- Extracts the title from the story's `index.md` (first H1 heading)
- Generates a `.epub` with table of contents and French language metadata
- Output goes to `book/epub/<story-slug>.epub`

**EPUBs are generated during CI** and should **NOT** be committed to git. The entire `book/` directory is in `.gitignore`.

## CI/CD Pipeline

`.github/workflows/deploy.yml` runs on every push to `main`:

1. **Checkout** the repository
2. **Install mdBook** (latest release binary)
3. **Install pandoc** (for EPUB generation)
4. **Build book** — `mdbook build` outputs to `book/`
5. **Generate EPUBs** — runs `scripts/generate-epub.sh` (after build, into `book/epub/`)
6. **Deploy** — pushes `book/` to GitHub Pages

## Custom Styles

`css/custom.css` provides styles for:
- `.wip-banner` — yellow/amber banner for stories in progress (adapts to light/dark themes)
- `.epub-download` — styled download button
- `.guidelines-link` — subtle link to guidelines page
- `.act-subtitle` — italic act subtitles
- Reading experience tweaks (max-width, line-height)

## Workflow Rules

### Writing a New Story

1. Create the story directory: `src/<story-slug>/`
2. Create `guidelines.md` with the creative guidelines
3. Create `index.md` with synopsis, WIP banner, EPUB and guidelines links
4. Write chapters as `chapitre-01.md`, `chapitre-02.md`, etc.
5. Update `src/SUMMARY.md` to add the story and its chapters
6. Test locally: `mdbook serve --open`
7. Commit and push — CI builds the EPUB and deploys

### Writing a Chapter

1. Create the chapter file following the naming convention
2. Add the chapter entry in `src/SUMMARY.md`
3. Test locally: `mdbook serve`

### Completing a Story

1. Remove the `<div class="wip-banner">...</div>` from the story's `index.md`
2. Commit and push

### Content Guidelines

- All story content is written in **French**
- Code, config files, scripts, and technical documentation are in **English**
- Never use copyrighted names or direct references to existing works
- Each chapter should be **self-contained enough** to be satisfying on its own
- End chapters on a hook or revelation to maintain momentum
- Source files (raw markdown) should not linger at the project root — integrate them into `src/`

### Content Integrity Rules

**Story content is sacred. Never process it with batch text transformations (sed, awk, regex pipelines) that could silently destroy text.**

When migrating or transforming markdown content:
- **Never use `sed` to strip YAML front matter** — it matches all `---` lines, including horizontal rules inside the content. Instead, use `tail -n +N` to skip a known number of header lines.
- **Never use `sed '/^$/N;/^\n$/d'`** or similar blank-line collapsing — it destroys paragraph spacing that is part of the story's rhythm and formatting.
- **Always verify line counts** before and after any transformation: `wc -l` on source vs output. Any significant difference means content was lost.
- **Prefer writing files directly** (via Write tool or manual copy) over piping through text-processing chains.
- When in doubt, **read the output file and compare** with the original to confirm nothing was lost.

### Local Development

```bash
# Serve locally with hot-reload
mdbook serve --open

# Generate EPUBs locally
./scripts/generate-epub.sh

# Full build (mdbook first, then EPUBs into book/)
mdbook build && ./scripts/generate-epub.sh
```
