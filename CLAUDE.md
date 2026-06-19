# The Pedanticism

**Purpose:** A team of reusable Claude Code skills that interrogate a request — relentlessly — *before* any work starts, surfacing every hidden assumption.

**The roster (3 invocable skills):**
- `/pedantic-engineer` — the Engineer. *"Why does this matter technically?"* — implementation crux, data shapes, coupling, edge cases. (Disciplined, high-signal.)
- `/pedantic-pm` — the Product Manager. *"Why does this matter in the market and for users?"* — product + UX only. Relentless rounds.
- `/pedantic-team` — the orchestrator. Fires all lenses at once (Engineering + Product + UX) in combined relentless rounds.

**Core behavior (pm + team):** Relentless Rounds — open with a big batch, then generate new deeper follow-ups after every answer, never declaring "enough" until the user explicitly says stop; then emit a forced-assumptions block. See `skill/interrogation-protocol.md`.

**The one rule that matters:** only GOOD questions. Volume comes from breadth + depth, never padding. Every question must be decision-changing, specific & bounded, non-redundant, and assumption-exposing. A flood of mediocre questions is the failure mode. See the bar in `skill/interrogation-protocol.md`.

**Editing conventions:**
- Each `.claude/skills/<role>/SKILL.md` is self-contained (valid frontmatter + persona + protocol). Edit there to change a role's behavior.
- Shared reference: `skill/interrogation-protocol.md` (cadence + bar), `skill/pm-question-bank.md` (product/UX), `skill/question-framework.md` (engineering).
- Run `scripts/validate.sh` to verify all skills load.

**Flavor rule:** the house style lives in headers/README only — the questions themselves stay plain, sharp, and professional. Theme never competes with clarity.
