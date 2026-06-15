# Pedantic Engineer

**Purpose:** A reusable Claude Code capability that asks pedantic, high-signal clarifying questions before doing work.

**Behavior:** On every task, classifies ambiguity level (clear / partially specified / dangerously ambiguous / conflicting). If ambiguous, asks prioritized questions before acting.

**Quickstart:** In any Claude Code session, type `/pedantic-engineer` to activate, or just reference the persona in your prompt: "Act as the Pedantic Engineer."

**Editing Conventions:**
- Preserve the behavioral contract in `skill/behavior-spec.md`
- System prompt lives in `skill/system-prompt.md`
- Questions organized by type in `skill/question-framework.md`
- Eval rubric in `evals/rubric.md`

**Evals:** Run `scripts/validate.sh` to check required files and headings. Review `evals/test-cases.md` for adversarial prompts.

**Rule:** Never weaken the pedantic persona. Never ask filler questions. Always surface hidden coupling, backward compatibility, and observability gaps.
