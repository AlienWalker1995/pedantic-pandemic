```
        ()  ()
         ()()           THE
      .-"-..-"-.    ___ ___ ___   _   _  _ _____ ___ ___
     /  o    o  \  | _ \ __|   \ /_\ | \| |_   _|_ _/ __|
    |    .--.    | |  _/ _|| |) / _ \| .` | | |  | | (__
     \  (    )  /  |_| |___|___/_/ \_\_|\_| |_| |___\___|
      '-..__.-'   ___ ___ _  _ ___  ___ __  __ ___ ___
       /  ||  \  | _ \ _ \ \| |   \| __|  \/  |_ _/ __|
      (   ||   ) |  _/   / .` | |) | _|| |\/| || | (__
       '--''--'  |_| |_|_\_|\_|___/|___|_|  |_|___\___|   🦠

   an outbreak of questions you can't escape · there is no cure, only answers
```

# The Pedantic Pandemic 🦠

> Patient zero: your half-baked request. Symptoms: 40 questions and rising. Prognosis: a spec.

A reusable Claude Code skill repository: a **team of pedantic personas** that interrogate a request — relentlessly — *before* any work starts, so every hidden assumption is surfaced first.

## The roster — five members, asked in order

The team interrogates a request in flow order: **Product → UX → Frontend → Backend → DevOps.** Each phase informs the next.

| # | Skill | Role | Organizing question | Owns |
|---|---|---|---|---|
| 1 | `/pedantic-pm` | Product Manager | *"Why does this matter **in the market**?"* | problem/JTBD, segment, value, metrics, scope, prioritization, business model |
| 2 | `/pedantic-ux` | UX Designer | *"How will the user **actually experience** this?"* | flows, IA, states, interaction, content, accessibility, responsiveness |
| 3 | `/pedantic-frontend` | Frontend Engineer | *"Why does this matter **in the client**?"* | rendering, components, state, data-fetching, performance, a11y impl |
| 4 | `/pedantic-engineer` | Backend / Core Engineer | *"Why does this matter **technically**?"* | data model, APIs, coupling, edge cases, security, backward-compat, testing |
| 5 | `/pedantic-devops` | DevOps / SRE Engineer | *"How does it **ship & operate** reliably?"* | CI/CD, infra/IaC, config/secrets, scaling, reliability/SLOs, observability |
| — | `/pedantic-team` | Team lead (orchestrator) | all of the above, in order | runs the five members Product → … → DevOps |

**Core behavior:** *Relentless Rounds* via the interactive `AskUserQuestion` selector — open broad, generate new deeper follow-ups after every answer, never declare "enough" until you say *stop*, then emit a forced-assumptions block. Each member's parameters are detailed verbosely in its `SKILL.md` + companion `skill/*-question-bank.md`.

**The one rule:** only **good** questions. Volume comes from breadth + depth, never padding — every question must be decision-changing, specific, non-redundant, and assumption-exposing. A flood of mediocre questions is the failure mode. (`skill/interrogation-protocol.md`)

## Why I made this

Every team has that one person you can't actually fault. They ask the questions nobody else thought of — the ones that save you a week of rework three months later. And they're also, let's be honest, *a little exhausting*: the thing you figured was "just add a button" turns into forty questions about empty states, rollback plans, and who actually asked for this.

You can't fault them. The questions are good. They're just relentless.

**This is that person — bottled.** Five of them, actually, one per discipline. The Pedantic Pandemic takes the most useful annoying-coworker instinct (relentless, high-signal questioning) and points it at your half-baked request *before* you write a line of code. You can't fault the questions — they have to clear a strict "is this actually worth asking?" bar. And unlike the real coworker, you can tell it to stop the moment you've had enough.

## What This Is

A private, portable repo that packages prompt-based capabilities. Loaded into any Claude Code session, the team surfaces ambiguity and sharpens a request before execution.

## How to Use with Claude Code

### Option 1: Slash-command skills (Recommended)
Copy the `.claude/skills/` directory (it holds `pedantic-pm/`, `pedantic-ux/`,
`pedantic-frontend/`, `pedantic-engineer/`, `pedantic-devops/`, and `pedantic-team/`)
into your project's `.claude/skills/` folder (or `~/.claude/skills/` for all projects).
Claude Code discovers each `SKILL.md` via its YAML frontmatter, making the six
`/pedantic-*` commands invocable. Each `SKILL.md` is self-contained. Run
`/pedantic-team` for the full ordered grilling, or a single member for one lens.

### Option 2: CLAUDE.md project memory
Place this repo (or just `CLAUDE.md`) in your project root. Claude Code auto-discovers
`CLAUDE.md` and loads it as project memory in every session.

### Option 3: System Prompt
```bash
claude --system-prompt "$(cat skill/system-prompt.md)"
```

### Option 4: Custom Agent
```bash
claude --agents '{"pedantic": {"description": "Pedantic Engineer", "prompt": "$(cat skill/system-prompt.md)"}}'
```

## How to Use with Cursor

The same six personas ship as **Cursor rules** under `.cursor/rules/*.mdc`
(`pedantic-pm.mdc` … `pedantic-team.mdc`). Copy the `.cursor/` directory into your
project root (or merge into an existing `.cursor/rules/`). Each is an **Agent
Requested** rule (`alwaysApply: false`): Cursor reads the `description` and pulls the
matching persona in when your task fits it, or you invoke one explicitly in chat
(e.g. *"use the pedantic-pm rule"*). Cursor has no `AskUserQuestion` selector, so the
personas fall back to the numbered quick-pick questions they already describe —
behavior is otherwise identical.

The Cursor rules are **generated from the Claude `SKILL.md` files** (single source of
truth) by `scripts/sync-cursor.sh`; re-run it after editing any `SKILL.md`. Both
runtimes are checked by `scripts/validate.sh`.

## How the Persona Behaves

1. **Classifies** every request: clear / partially specified / dangerously ambiguous / conflicting constraints
2. **Asks** prioritized questions (objective → scope → constraints → interfaces → risk → testing → rollout)
3. **Never** asks filler questions or questions answerable from context
4. **Proceeds** only with explicit "just proceed" + logged assumptions
5. **Maintains** assumptions, known unknowns, risks, acceptance criteria throughout

## Quickstart

```bash
cd /path/to/your/project
cp -r /path/to/pedantic-engineer/* .
# CLAUDE.md is auto-loaded. Done.
```

## Examples

See `examples/` for real-world inputs and the skill's pedantic responses:
- `vague-feature-request.md` — feature request with missing acceptance criteria
- `ambiguous-bug-report.md` — bug report with unclear reproduction steps
- `under-specified-refactor.md` — refactor with unknown coupling
- `architecture-review.md` — architecture decision with missing constraints

## Adapting for a Team

1. Copy `.claude/skills/pedantic-engineer/` into your project's `.claude/skills/` folder
2. Customize `skill/question-framework.md` for your team's common task types
3. Add team-specific examples to `examples/`
4. Update `evals/test-cases.md` with your domain's adversarial prompts
5. Commit CLAUDE.md to project root for auto-discovery

## Repo Structure

```
pedantic-pandemic/
  .claude/skills/<role>/
    SKILL.md             # One per role (pm, ux, frontend, engineer, devops, team) — the invocable /pedantic-* skill
  .cursor/rules/
    pedantic-*.mdc       # The same six, generated for Cursor (Agent Requested rules)
  CLAUDE.md              # Auto-loaded project memory
  README.md              # This file
  .gitignore
  docs/
    overview.md          # High-level description
    decision-log.md      # Why CLAUDE.md + skills pattern
    assumptions.md       # Setup assumptions
    design-principles.md # Design philosophy
    usage-patterns.md    # How to use in practice
  skill/
    system-prompt.md     # Canonical prompt
    behavior-spec.md     # Behavioral rules
    question-framework.md # Question checklist by type
    refusal-and-assumption-policy.md # When to refuse / how to assume
    examples.md          # 8+ examples with inputs and outputs
  evals/
    rubric.md            # Scoring dimensions
    test-cases.md        # 12+ test cases
    golden-examples.md   # 5 canonical outputs
  scripts/
    validate.sh          # Skill-loadability + file/heading checks (both runtimes)
    sync-cursor.sh       # Generate .cursor/rules/*.mdc from the SKILL.md files
  examples/
    vague-feature-request.md
    ambiguous-bug-report.md
    under-specified-refactor.md
    architecture-review.md
```
