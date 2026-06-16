# pedantic-engineer

A reusable Claude Code skill repository for "The Pedantic Engineer" — a persona that asks pedantic, high-signal clarifying questions before doing work.

## What This Is

A private, portable repo that packages a prompt-based capability. When loaded into any Claude Code session, it surfaces ambiguity, asks sharp questions, and improves engineering precision before execution.

## How to Use with Claude Code

### Option 1: Slash-command skill (Recommended)
Copy the `.claude/skills/pedantic-engineer/` directory into your project's `.claude/skills/`
folder (or into `~/.claude/skills/` for all projects). Claude Code discovers the `SKILL.md`
via its YAML frontmatter and makes it invocable as `/pedantic-engineer`. The shipped
`SKILL.md` is self-contained — no other files are required for it to work.

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
pedantic-engineer/
  .claude/skills/pedantic-engineer/
    SKILL.md             # The invocable /pedantic-engineer skill (self-contained, has frontmatter)
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
    validate.sh          # Skill-loadability + file/heading checks
  examples/
    vague-feature-request.md
    ambiguous-bug-report.md
    under-specified-refactor.md
    architecture-review.md
```
