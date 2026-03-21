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

### Hugo Static Site

- **Theme**: [hugo-book](https://github.com/alex-shpak/hugo-book) — installed as a git submodule in `themes/hugo-book`
- **Deployment**: GitHub Pages via GitHub Actions (`.github/workflows/deploy.yml`)
- **URL**: https://gghez.github.io/distechnie/
- **Language**: French (content and UI)
- **Config**: `hugo.toml` — BookSection is set to `stories`, dark/light mode auto

### Content Structure

```
content/
  _index.md                          # Landing page
  menu/
    index.md                         # Sidebar top-level menu (headless bundle)
  stories/
    _index.md                        # Stories index
    <story-slug>/
      _index.md                      # Story overview (title, synopsis, metadata, shortcodes)
      chapitre-01.md                 # Chapter 1
      chapitre-02.md                 # Chapter 2
      ...
      guidelines.md                  # Creative guidelines (hidden from sidebar)
```

### Custom Shortcodes

All shortcodes live in `layouts/shortcodes/`:

| Shortcode | File | Purpose |
|---|---|---|
| `{{</* story-status */>}}` | `story-status.html` | Renders a WIP banner if `status: wip` in front matter |
| `{{</* epub-link story="<slug>" */>}}` | `epub-link.html` | Download button linking to `/epub/<slug>.epub` |
| `{{</* guidelines-link */>}}` | `guidelines-link.html` | Link to the story's guidelines page (renders only if `guidelines.md` exists) |
| `{{</* story-toc */>}}` | `story-toc.html` | Auto-generated ordered list of child chapter pages |

### Custom Styles

- `assets/css/custom.css` — site styles (EPUB link, guidelines link, WIP banner, reading experience)
- `assets/css/epub.css` — EPUB-specific typography (Georgia, justified text, page breaks)
- `layouts/partials/custom-head.html` — injects `custom.css` into the HTML head

### Logo

`static/images/logo.svg` — broken hexagon chip with glitch text, uses `currentColor` for auto dark/light adaptation.

## Story _index.md Format

```yaml
---
title: "Story Title"
weight: <order in sidebar>
bookCollapseSection: false
status: wip  # optional — "wip" shows a yellow banner, omit or remove when the story is complete
---
```

The body should contain (in this order):
1. Story title as H1
2. `{{</* story-status */>}}` shortcode (WIP banner, only renders if `status: wip`)
3. `{{</* epub-link story="<story-slug>" */>}}` shortcode (EPUB download)
4. `{{</* guidelines-link */>}}` shortcode (link to guidelines page, only renders if `guidelines.md` exists)
5. Genre and synopsis
6. `---` separator
7. `{{</* story-toc */>}}` shortcode (chapter listing)

## Guidelines Page

Each story can (and should) have a `guidelines.md` file containing the creative guidelines used to build the story: concept, characters, plot structure, writing principles. This is the reference document for writing sessions with Claude Code.

- Uses `bookHidden: true` so it does not appear in the sidebar navigation
- Uses `weight: 99` to keep it last in page ordering
- Accessible via the `{{</* guidelines-link */>}}` shortcode on the story's index page
- **Source markdown files should not be kept at the project root** — they are integrated into the story directory

```yaml
---
title: "Guidelines"
weight: 99
bookHidden: true
---
```

## Chapter Format

```yaml
---
title: "Chapitre N — Chapter Title"
weight: <chapter number>
---
```

The body should contain:
1. The chapter title as H1
2. `{{</* epub-link story="<story-slug>" */>}}` shortcode
3. Act subtitle in italics (e.g., `*Acte I — Les signaux*`) if the story uses acts
4. The chapter content

## Naming Conventions

- Story directories: kebab-case (`le-dernier-developpeur`)
- Chapter files: `chapitre-NN.md` (zero-padded two digits: `chapitre-01.md`, `chapitre-02.md`, ...)
- Guidelines file: always `guidelines.md` inside the story directory
- EPUB files: `<story-slug>.epub` (auto-generated in `static/epub/`, never committed)

## EPUB Generation

EPUBs are generated by `scripts/generate-epub.sh` using pandoc:

- Iterates over each story directory in `content/stories/`
- Collects all `chapitre-*.md` files (sorted alphabetically, hence the zero-padded numbering)
- Strips YAML front matter and Hugo shortcodes (`{{< ... >}}`, `{{% ... %}}`)
- Generates a `.epub` with table of contents, French language metadata
- Applies `assets/css/epub.css` for typography
- Output goes to `static/epub/<story-slug>.epub`

**EPUBs are generated during CI** (GitHub Actions) and should **NOT** be committed to git. They are listed in `.gitignore` under `static/epub/`.

## CI/CD Pipeline

`.github/workflows/deploy.yml` runs on every push to `main`:

1. **Install Hugo** extended (v0.158.0)
2. **Install pandoc** (for EPUB generation)
3. **Checkout** with `submodules: recursive` (to get the hugo-book theme)
4. **Generate EPUBs** — runs `scripts/generate-epub.sh`
5. **Build Hugo** — `hugo --gc --minify` with the GitHub Pages base URL
6. **Deploy** — pushes `public/` to GitHub Pages

GitHub Pages is configured with `build_type: workflow` (not branch-based).

## Workflow Rules

### Writing a New Story

1. Create the story directory: `content/stories/<story-slug>/`
2. Create `guidelines.md` with the creative guidelines (concept, characters, structure, principles)
3. Create `_index.md` with story metadata, synopsis, and all shortcodes (see format above)
4. Set `status: wip` in front matter
5. Write chapters as `chapitre-01.md`, `chapitre-02.md`, etc.
6. Test locally: `hugo server --buildDrafts`
7. Commit and push — CI builds the EPUB and deploys

### Writing a Chapter

1. Create the chapter file following the naming convention
2. Include the epub-link shortcode and act subtitle
3. Use `draft: true` in front matter while work is in progress
4. When ready, remove the draft flag and commit

### Completing a Story

1. Remove `status: wip` from the story's `_index.md` front matter
2. The WIP banner disappears automatically
3. The guidelines page remains accessible for reference

### Content Guidelines

- All story content is written in **French**
- Code, config files, scripts, and technical documentation are in **English**
- Never use copyrighted names or direct references to existing works
- Each chapter should be **self-contained enough** to be satisfying on its own
- End chapters on a hook or revelation to maintain momentum
- Source files (raw markdown) should not linger at the project root — integrate them into the content structure

### Local Development

```bash
# Serve locally with drafts
hugo server --buildDrafts

# Generate EPUBs locally
./scripts/generate-epub.sh

# Full build
./scripts/generate-epub.sh && hugo --minify
```
