# The Pedantic Pandemic 🦠

**Purpose:** A team of reusable Claude Code skills that interrogate a request — relentlessly — *before* any work starts, surfacing every hidden assumption.

**The roster (6 invocable skills) — asked in flow order Product → UX → Frontend → Backend → DevOps:**
- `/pedantic-pm` — Product Manager. *"Why does this matter in the market?"* — problem/JTBD, segment, metrics, scope, business model. (First.)
- `/pedantic-ux` — UX Designer. *"How will the user actually experience this?"* — flows, states, interaction, content, accessibility, responsiveness.
- `/pedantic-frontend` — Frontend Engineer. *"Why does this matter in the client?"* — rendering, components, state, data-fetching, Core Web Vitals, a11y impl.
- `/pedantic-engineer` — Backend/Core Engineer. *"Why does this matter technically?"* — data model, APIs, coupling, edge cases, security, migrations, testing.
- `/pedantic-devops` — DevOps/SRE. *"How does it ship & operate reliably?"* — CI/CD, IaC, config/secrets, scaling, reliability/SLOs, observability.
- `/pedantic-team` — orchestrator. Runs the five members in order.

**Core behavior:** Relentless Rounds via the interactive `AskUserQuestion` selector — open broad, generate new deeper follow-ups after every answer, never declaring "enough" until the user explicitly says stop; then emit a forced-assumptions block. See `skill/interrogation-protocol.md`.

**The one rule that matters:** only GOOD questions. Volume comes from breadth + depth, never padding. Every question must be decision-changing, specific & bounded, non-redundant, and assumption-exposing. A flood of mediocre questions is the failure mode. See the bar in `skill/interrogation-protocol.md`.

**Editing conventions:**
- Each `.claude/skills/<role>/SKILL.md` is self-contained (valid frontmatter + persona + protocol). Edit there to change a role's behavior.
- Shared reference: `skill/interrogation-protocol.md` (cadence + bar) and per-member banks: `pm-question-bank.md` (product), `ux-question-bank.md`, `frontend-question-bank.md`, `question-framework.md` (backend), `devops-question-bank.md`.
- Run `scripts/validate.sh` to verify all skills load.

**Flavor rule:** the 🦠 pandemic theme lives in headers/README only — the questions themselves stay plain, sharp, and professional. Theme never competes with clarity.
