```
    ___      ___      ___      ___      ___
   [-,-]    [-,-]    [-,-]    [-,-]    [-,-]
   /|=|\    /|=|\    /|=|\    /|=|\    /|=|\
    | |      | |      | |      | |      | |

       T H E   P E D A N T I C I S M

   a standing committee of pedants — engineer · PM · …
   they will not stop asking. that is the point.
```

# The Pedanticism

> A movement, not a meeting. Bring a half-baked request; leave with a spec — and a lot of answered questions.

A reusable Claude Code skill repository: a **team of pedantic personas** that interrogate a request — relentlessly — *before* any work starts, so every hidden assumption is surfaced first.

## The roster

| Skill | Role | Organizing question | Asks about |
|---|---|---|---|
| `/pedantic-engineer` | Engineer | *"Why does this matter **technically**?"* | implementation: data shapes, coupling, edge cases, backward-compat, testing, ops |
| `/pedantic-pm` | Product Manager | *"Why does this matter **in the market and for users**?"* | **product + UX** |
| `/pedantic-team` | Team lead (orchestrator) | all of the above, combined | fires **Engineering + Product + UX** at once |

**Core behavior** (PM + team): *Relentless Rounds* — open with a big batch, generate new deeper follow-ups after every answer, never declare "enough" until you say *stop*, then emit a forced-assumptions block. Questions are asked via the interactive `AskUserQuestion` selector (quick-pick), so a flood stays answerable.

**The one rule:** only **good** questions. Volume comes from breadth + depth, never padding — every question must be decision-changing, specific, non-redundant, and assumption-exposing. A flood of mediocre questions is the failure mode. (`skill/interrogation-protocol.md`)

## What This Is

A private, portable repo that packages prompt-based capabilities. Loaded into any Claude Code session, the team surfaces ambiguity and sharpens a request before execution.

## How to Use with Claude Code

### Option 1: Slash-command skills (Recommended)
Copy the `.claude/skills/` directory (it holds `pedantic-engineer/`, `pedantic-pm/`, and
`pedantic-team/`) into your project's `.claude/skills/` folder (or `~/.claude/skills/` for
all projects). Claude Code discovers each `SKILL.md` via its YAML frontmatter, making
`/pedantic-engineer`, `/pedantic-pm`, and `/pedantic-team` invocable. Each `SKILL.md` is
self-contained — no other files are required for it to work.

### Option 2: CLAUDE.md project memory
Place this repo (or just `CLAUDE.md`) in your project root. Claude Code auto-discovers
`CLAUDE.md` and loads it as project memory in every session.

### Option 3: System Prompt
```bash
claude --system-prompt "$(cat skill/system-prompt.md)"
```

## How the personas behave

1. **Classify** every request: clear / partially specified / dangerously ambiguous / conflicting constraints
2. **Ask** relentless rounds of quick-pick questions (via `AskUserQuestion`), each probing the last answers
3. **Never** ask filler questions or questions answerable from context
4. **Stop** only when you explicitly say so — then emit a forced-assumptions block
5. **Maintain** assumptions, known unknowns, risks, and acceptance criteria throughout

## Examples

See `examples/` for real-world inputs and the team's pedantic responses:
- `pm-vague-feature.md` — a vague feature request, PM lens
- `team-combined-interrogation.md` — the whole team, all lenses at once
- `vague-feature-request.md`, `ambiguous-bug-report.md`, `under-specified-refactor.md`, `architecture-review.md` — engineer lens

## Repo structure

```
pedantic-engineer/                      # (repo name; brand = The Pedanticism)
  .claude/skills/
    pedantic-engineer/SKILL.md          # /pedantic-engineer  (engineer lens)
    pedantic-pm/SKILL.md                # /pedantic-pm        (product + UX lens)
    pedantic-team/SKILL.md              # /pedantic-team      (orchestrator, all lenses)
  CLAUDE.md                             # auto-loaded project memory
  README.md
  skill/
    interrogation-protocol.md           # Relentless Rounds + the good-question bar (shared)
    pm-question-bank.md                 # product + UX taxonomy
    system-prompt.md, behavior-spec.md, question-framework.md, …  # engineer reference
  evals/        rubric.md, test-cases.md, golden-examples.md
  examples/     pm-vague-feature.md, team-combined-interrogation.md, …
  scripts/      validate.sh             # verifies all 3 skills load
```
