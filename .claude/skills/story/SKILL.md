---
name: story
description: "Load a story's creative context for a writing session. Use when the user says /story <slug>, or asks to work on a story, write a chapter, edit/correct a chapter, or start a writing session (e.g., 'on bosse sur le dernier développeur', 'écris le chapitre 10', 'je veux avancer sur la nouvelle', 'corrige le chapitre 3', 'retravaille le chapitre 5', 'fix le chapitre 2 du dernier développeur')."
argument-hint: "[story-slug] [chapitre-NN]"
allowed-tools: Bash(ls *), Bash(wc *), Bash(head *), Read, Glob, Grep
---

## Purpose

Prepare a writing session by loading the creative guidelines of a story and displaying its current status. This ensures tone, characters, structure, and writing principles are in context before any content work begins.

## Story Discovery

Stories live under `src/` in the project root. Each story is a directory containing:
- `index.md` — story overview (title, synopsis, WIP banner, links)
- `chapitre-NN.md` — chapter files (zero-padded)
- `guidelines.md` — creative guidelines (concept, characters, tone, structure, writing principles)

## Steps

### Step 1 — Resolve the story and target chapter

Parse `$ARGUMENTS` for a story slug and an optional chapter reference (e.g., `le-dernier-developpeur chapitre-03`, or `le-dernier-developpeur 3`).

If the user mentions a chapter number without the `chapitre-` prefix, resolve it to the file `chapitre-NN.md` (zero-padded).

If `$ARGUMENTS` is empty:
1. List available stories by scanning directories under `src/` that contain an `index.md`
2. Present the list to the user and ask which story to load

Validate that `src/<slug>/guidelines.md` exists. If not, tell the user no guidelines were found for this story.

### Step 2 — Load guidelines

Read `src/<slug>/guidelines.md` in full. Internalize the creative guidelines: concept, characters, tone, narrative structure, writing principles.

### Step 3 — Load target chapter (if specified)

If a chapter was identified in Step 1 (either from `$ARGUMENTS` or from the user's intent, e.g., "corrige le chapitre 3"):

1. Read `src/<slug>/chapitre-NN.md` in full
2. Display the chapter title and confirm it has been loaded into context
3. The user's next instruction will apply to this chapter (edit, rewrite, correct, etc.)

If no chapter was specified, skip this step.

### Step 4 — Assess current status

1. List all `chapitre-*.md` files in `src/<slug>/` and extract each chapter title (first H1 line)
2. Read `src/<slug>/index.md` and check if the WIP banner div is present
3. Read `src/SUMMARY.md` and look for:
   - Chapters listed under this story's section
   - Draft entries (empty links `[Title]()`) indicating planned but unwritten chapters

### Step 5 — Present status report

Display a concise report:

```
📖 <Story Title>
Status: En cours d'écriture / Terminée
Chapitres: N écrits [+ M prévus]

Ton: <key tone reminder>
POV: <point of view>
Contraintes: <any critical constraint from guidelines>
```

### Step 6 — Ready prompt

If a target chapter was loaded: confirm the chapter is in context and ask the user what they want to do with it (edit, rewrite a section, correct tone, etc.).

If no target chapter: ask the user what they want to do:
- Write a new chapter
- Edit an existing chapter
- Brainstorm / develop an idea
- Review structure or guidelines

## Error Handling

- If the story directory does not exist: list available stories and ask the user to pick one
- If `guidelines.md` is missing: warn the user and suggest creating one before writing
- If no chapters exist yet: mention it and suggest starting with chapter 1
