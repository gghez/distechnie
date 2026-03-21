---
name: story-review
description: "Run all 4 story review agents in parallel on a story's chapters. Use when the user says /story-review <slug>, or asks to review a story (e.g., 'review le-dernier-developpeur', 'lance une review de la story', 'review les chapitres')."
argument-hint: "<story-slug> [chapitre-NN or N] [chapitre-MM or M]"
allowed-tools: Agent, Read, Glob, Grep, Bash(ls *), Bash(wc *)
---

## Purpose

Launch the 4 story review agents in parallel on the specified story chapters, then synthesize their findings into a single actionable report for the user.

## Review Agents

The review agents are defined in `.claude/agents/`:
- `story-tech-reviewer.md` — Technical accuracy (software dev, AI agents, footnotes)
- `story-consistency-reviewer.md` — Narrative consistency (timeline, character arcs, contradictions)
- `story-style-reviewer.md` — Style, tone, pacing, repetitions
- `story-reader-reviewer.md` — First reader experience (engagement, clarity, emotion)

## Steps

### Step 1 — Resolve scope

Parse `$ARGUMENTS` for a story slug and optional chapter references.

- If only a slug is provided: review ALL chapters of that story
- If slug + chapter numbers: review only those chapters
- If empty: list available stories and ask

Validate that `src/<slug>/guidelines.md` exists.

### Step 2 — Identify files to review

1. Read `src/<slug>/guidelines.md` — this will be passed to all agents
2. List all `chapitre-*.md` files in scope
3. Build the file paths list

### Step 3 — Launch 4 agents in parallel

Launch 4 agents using the `Agent` tool, ALL IN A SINGLE MESSAGE (parallel execution). Each agent is `general-purpose` type.

For each agent:
1. Read the agent's instruction file from `.claude/agents/` (e.g., `.claude/agents/story-tech-reviewer.md`)
2. Include the full content of that instruction file as the agent's system prompt
3. Tell the agent to read the guidelines file and all chapter files in scope
4. Tell the agent to produce its structured report

**IMPORTANT**: Launch all 4 agents simultaneously using `run_in_background: true` for the first 3 and wait on the 4th, OR launch all 4 with `run_in_background: true`. The goal is maximum parallelism.

### Step 4 — Synthesize

Once all 4 agents have returned, produce a unified report for the user:

```
# Story Review — <Story Title>
Chapitres analysés : <list>

## 🔧 Crédibilité technique
<key findings from tech reviewer>

## 🔗 Cohérence narrative
<key findings from consistency reviewer>

## ✍️ Style & rythme
<key findings from style reviewer>

## 👁️ Regard lecteur
<key findings from reader reviewer>

## Actions prioritaires
1. <most critical issue>
2. <second most critical>
3. ...
```

### Synthesis rules

- **Deduplicate**: if multiple agents flag the same issue, mention it once and note which agents agree
- **Prioritize**: lead with issues that affect the reader experience or break the story's logic
- **Be specific**: include line numbers and quotes from the agents' reports
- **Separate by chapter**: if reviewing multiple chapters, organize findings per chapter
- **Acknowledge strengths**: include what works well — the user needs positive signal too

## Error Handling

- If a story directory doesn't exist: list available stories
- If no chapters exist: tell the user there's nothing to review
- If an agent fails: report results from the agents that succeeded, note which one failed
