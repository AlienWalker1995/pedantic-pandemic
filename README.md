<div align="center">

# The Pedantic Pandemic 🦠

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

### Five pedantic teammates who grill your request before a line of code exists.

**Patient zero: your half-baked request. Symptoms: 40 questions and rising. Prognosis: a spec.**

![Agent Skills](https://img.shields.io/badge/format-Agent_Skills_SKILL.md-d97757?style=flat-square)
![Harnesses](https://img.shields.io/badge/runs_in-Claude_Code_·_Codex_·_Gemini_·_Cursor_·_Copilot_·_OpenCode_·_Hermes-000000?style=flat-square)
![Flow](https://img.shields.io/badge/flow-Product_→_UX_→_Frontend_→_Backend_→_DevOps-22c55e?style=flat-square)
![Validated](https://img.shields.io/badge/scripts%2Fvalidate.sh-portable_format-6b7280?style=flat-square)

**[Install](#install) · [The roster](#the-roster) · [How it works](#how-it-works) · [Example](#example) · [FAQ](#faq) · [Repo layout](#repo-layout)**

<img src="docs/assets/hero.svg" alt="A vague request, 'just add a button', passes through five pedantic personas in order (Product, UX, Frontend, Backend, DevOps) and comes out as a spec with logged assumptions" width="1000" />

</div>

---

Six portable agent skills that interrogate a request, relentlessly, **before** any work starts, so every hidden assumption surfaces while it is still cheap to change. Each persona owns one discipline, asks only questions that would change a decision, and keeps going until you say *stop*. Then it writes down the assumptions it was forced to make.

## Why I made this

Every team has that one person you cannot actually fault. They ask the questions nobody else thought of, the ones that save you a week of rework three months later. And they are also, let's be honest, *a little exhausting*: the thing you figured was "just add a button" turns into forty questions about empty states, rollback plans, and who actually asked for this.

You cannot fault them. The questions are good. They are just relentless.

**This is that person, bottled.** Five of them, actually, one per discipline. The Pedantic Pandemic takes the most useful annoying-coworker instinct, relentless high-signal questioning, and points it at your half-baked request *before* you write a line of code. Every question has to clear a strict "is this actually worth asking?" bar. And unlike the real coworker, you can tell it to stop the moment you have had enough.

## Install

```bash
git clone https://github.com/AlienWalker1995/pedantic-pandemic.git
cd pedantic-pandemic
./install.sh all                      # every harness, for every project
./install.sh agents --project ~/app   # or one harness, for one project
```

Each persona is a standard [Agent Skills](https://agentskills.io/specification) folder (`SKILL.md` with `name` and `description` frontmatter), so one copy works everywhere. The installer copies the six skills, plus the shared `skill/` reference docs they cite, into each target:

| Target | Folder | Harnesses |
|---|---|---|
| `agents` | `~/.agents/skills/` | Codex, Gemini CLI, Cursor, GitHub Copilot, OpenCode |
| `claude` | `~/.claude/skills/` | Claude Code |
| `hermes` | `~/.hermes/skills/` | Hermes |

`--project DIR` installs into `DIR/.agents/skills` and `DIR/.claude/skills` instead, and `--dry-run` shows what would be copied. Re-running replaces each skill with a fresh copy.

Run `/pedantic-team` for the full ordered grilling, or a single member for one lens. Harnesses without slash commands pick a persona up from its description when your task fits, or when you name it ("use pedantic-pm"). Where there is no interactive `AskUserQuestion` selector, the personas fall back to the numbered quick-pick questions they already describe; behavior is otherwise identical.

## The roster

The team interrogates in flow order, and each phase informs the next.

| # | Skill | Role | Organizing question | Owns |
|---|---|---|---|---|
| 1 | `/pedantic-pm` | Product Manager | *"Why does this matter **in the market**?"* | problem/JTBD, segment, value, metrics, scope, prioritization, business model |
| 2 | `/pedantic-ux` | UX Designer | *"How will the user **actually experience** this?"* | flows, IA, states, interaction, content, accessibility, responsiveness |
| 3 | `/pedantic-frontend` | Frontend Engineer | *"Why does this matter **in the client**?"* | rendering, components, state, data fetching, performance, a11y implementation |
| 4 | `/pedantic-engineer` | Backend / Core Engineer | *"Why does this matter **technically**?"* | data model, APIs, coupling, edge cases, security, backward compatibility, testing |
| 5 | `/pedantic-devops` | DevOps / SRE Engineer | *"How does it **ship and operate** reliably?"* | CI/CD, infra/IaC, config/secrets, scaling, reliability/SLOs, observability |
| · | `/pedantic-team` | Team lead (orchestrator) | all of the above, in order | runs the five members Product → UX → Frontend → Backend → DevOps |

## How it works

Every persona runs the same protocol, defined once in [`skill/interrogation-protocol.md`](skill/interrogation-protocol.md):

| Step | What happens |
|---|---|
| **Classify** | The request is labeled clear, partially specified, dangerously ambiguous, or conflicting. |
| **Relentless rounds** | Questions arrive through the interactive `AskUserQuestion` selector: broad first, then deeper follow-ups generated from each answer. |
| **Never "enough"** | The persona never declares itself satisfied. Only you end it, with *stop*, *proceed*, or *just build it*. |
| **Forced assumptions** | On stop, it emits an "Assumptions I'm forced to make" block, so every gap you skipped is written down instead of silently guessed. |

**The one rule: only good questions.** Volume comes from breadth and depth, never padding. Every question must be decision-changing, specific, non-redundant, and assumption-exposing. A flood of mediocre questions is the failure mode, and each member has its own question bank (`skill/*-question-bank.md`) to keep it on its own turf.

## Example

From [`examples/team-combined-interrogation.md`](examples/team-combined-interrogation.md), `/pedantic-team` on "Let's add notifications." (abridged):

```
🦠 The Pedantic Pandemic — Round 1
Classification: dangerously ambiguous (no user, no goal, no channel, no technical surface)

## 🔧 Engineering — why does it matter technically?
1. Does an event source for these notifications already exist?
   a) yes, there's an activity/events stream to hook   b) no, it must be built   c) unsure
2. Delivery transport?
   a) integrate existing provider (APNs/FCM/web-push)   b) build transport   c) email only (SMTP)

## 📈 Product — why does it matter in the market?
5. Core job for the user?
   a) re-engagement   b) time-sensitive alerts   c) reduce anxiety   d) drive an action
```

More in [`examples/`](examples/): a vague feature request, an ambiguous bug report, an under-specified refactor, an architecture review, and a PM-only grilling.

## FAQ

**Will it ever stop asking?** Only when you tell it to. That is the point: you decide when the remaining ambiguity is acceptable, and it records what it had to assume.

**Do I have to run all five?** No. `/pedantic-team` runs the whole flow; any single member gives you one lens, such as `/pedantic-devops` before a deploy change.

**Is the pandemic theme in the questions?** No. The 🦠 flavor lives in headers and this README. The questions themselves stay plain, sharp, and professional.

**How do I change a persona?** Edit its `.claude/skills/<role>/SKILL.md`, run `scripts/validate.sh` to check it still meets the portable format, then re-run `./install.sh all`.

**Why no Cursor `.mdc` rules?** Cursor loads Agent Skills directly, including from `.claude/skills`, so a second generated copy would only drift.

## Repo layout

```
.claude/skills/<role>/SKILL.md   the six invocable /pedantic-* skills (single source of truth)
install.sh                       copies the skills and skill/ into each harness's skills folder
skill/                           shared protocol, per-member question banks, behavior and refusal policy
examples/                        worked interrogations, one per scenario
evals/                           rubric, test cases, and golden outputs for judging persona quality
docs/                            overview, design principles, decision log, usage patterns
scripts/validate.sh              skill-loadability, portable-format, and structure checks
CLAUDE.md                        editing conventions for working on this repo
```

## License

[MIT](LICENSE) © 2026 AlienWalker1995
