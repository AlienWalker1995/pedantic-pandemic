# The Pedantic Pandemic: Overview

## What it is

Six portable agent skills that interrogate a request before any work starts. Five are discipline personas and one is the orchestrator that runs them in order:

| Skill | Persona | Organizing question |
|---|---|---|
| `pedantic-pm` | Product Manager | Why does this matter in the market? |
| `pedantic-ux` | UX Designer | How will the user actually experience this? |
| `pedantic-frontend` | Frontend Engineer | Why does this matter in the client? |
| `pedantic-engineer` | Backend / Core Engineer | Why does this matter technically? |
| `pedantic-devops` | DevOps / SRE Engineer | How does it ship and operate reliably? |
| `pedantic-team` | Team lead | Runs the five above: Product, UX, Frontend, Backend, DevOps |

Each skill is a standard Agent Skills folder (`SKILL.md` with `name` and `description` frontmatter), so the same file runs in Claude Code, Codex, Gemini CLI, Cursor, GitHub Copilot, OpenCode, and Hermes. `install.sh` copies them into each harness.

## Core behavior

- Classifies the request first: clear, partially specified, dangerously ambiguous, or conflicting.
- Asks in relentless rounds: broad questions first, then deeper follow-ups generated from each answer.
- Never declares itself satisfied. Only the user ends it (*stop*, *proceed*, *just build it*).
- On stop, writes down every assumption it was forced to make, plus open items and contradictions.

The cadence and the question bar are defined once in `skill/interrogation-protocol.md`.

## Why this exists

Projects fail most often at the requirements stage, not in implementation. Each persona surfaces the ambiguity in its own discipline while it is still cheap to change, and the forced-assumptions block makes every skipped gap visible instead of silently guessed.

## How it differs from a generic prompt

| Generic prompt | Pedantic Pandemic |
|---|---|
| "Do the task" | Classify ambiguity first |
| Asks whatever comes to mind | Only decision-changing questions, per discipline |
| Stops asking after one pass | Keeps going until the user says stop |
| Proceeds with silent assumptions | Logs every forced assumption |
| Optimizes for speed | Optimizes for correctness |
