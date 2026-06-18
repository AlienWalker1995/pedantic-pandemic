# The Pedantic Pandemic — Design Spec

**Date:** 2026-06-17
**Status:** Approved (brainstorming) → pending spec review

## Summary

Extend the existing `pedantic-engineer` repo into **The Pedantic Pandemic** 🦠 — a
"pedantic team" of Claude Code skills that interrogate a request *before* any work
starts. The contagion framing is brand/flavor only; the substance is a relentless,
never-satisfied clarifying-question engine across three roles.

The defining behavior is volume by design: the team asks an obscene number of
questions and keeps generating more after every answer, owning the annoyance as the
point — surfacing every hidden assumption before work begins.

**Non-negotiable: every question must be a *good* question.** The volume comes from
genuinely exhaustive coverage and deepening — never from padding, restating, or
generic templates. A flood of mediocre questions buries the signal and is the
failure mode this tool must avoid. Quality is the gate; volume is the result of
applying it across many real dimensions. See "What makes a good question" below.

## Roles (3 invocable skills)

| Skill (slug) | Role | Organizing question | Domain |
|---|---|---|---|
| `pedantic-engineer` *(exists, content unchanged)* | Engineer | **"Why does this matter technically?"** — the core crux of the reasoning: root cause, the real constraint, why the approach is justified | Implementation: data shapes, coupling, edge cases, backward-compat, testing, ops |
| `pedantic-pm` *(new)* | Product Manager | **"Why does this matter in the market and for users?"** — value: who cares, the problem/JTBD, what changes for the user, why now | Product + UX **only** |
| `pedantic-team` *(new, orchestrator)* | Team lead | Both, combined | Fires Engineering + Product + UX together — the "whole team grilling you" |

Engineering questions are owned by the engineer; the PM does not duplicate them. The
*team* orchestrator is what produces the combined engineering + UX + product flood.

## Core behavior: the "Relentless Rounds" protocol

Shared by `pedantic-pm` and `pedantic-team` (the engineer keeps its existing
standalone behavior; the orchestrator runs the engineer's domains through this
protocol when invoked as the team).

1. **Round 1 — outbreak:** open with a large batch of questions across the role's domains, grouped by category.
2. **Subsequent rounds — spread:** after *every* user answer, generate **new, deeper** follow-ups that probe the specifics of what was just said and expose fresh unknowns. Never repeat an answered question.
3. **No cure:** never declare "enough." Stop only when the user explicitly says "stop / proceed / just build it / that's enough."
4. **On forced stop:** emit a final **"Assumptions I'm forced to make"** block (each assumption + what changes if it's wrong) plus remaining open unknowns.
5. **Running state:** maintain Answered / Open / Assumptions / Contradictions across rounds.
6. **Quality gate (so volume ≠ noise):** before emitting any round, each question must pass the bar in "What makes a good question" below. Drop the ones that fail rather than padding the count. Exhaustive, not random.

## What makes a "good question" (the hard bar)

This is the heart of the tool. Volume is worthless without it. Every question — in
the first round and every follow-up — must pass all five tests; if it fails any,
cut it (do not soften the bar to hit a number):

1. **Decision-changing** — a different answer would change what we build, how, scope, or whether we build it at all. If the answer changes nothing, it's noise.
2. **Specific & bounded** — has a finite, concrete answer space. "What outcome should be true when done?" not "tell me about the requirements."
3. **Non-redundant** — not already answerable from what the user said or the surrounding context, and not a restatement of an answered question.
4. **Assumption-exposing** — ideally surfaces a hidden assumption, conflict, edge case, or unstated constraint the user hasn't considered — not a fact they obviously know.
5. **Earned (follow-ups only)** — probes a real ambiguity or risk that the *previous answer* opened up; not a generic next-item that ignores what was just said.

**Where the volume legitimately comes from:** breadth across many genuinely distinct
dimensions (product, UX, technical, edge cases, metrics, ops, …) and depth (drilling
into the specifics each answer reveals). Coverage and deepening — not repetition.

**Banned even at maximum volume (the failure mode):**
- Generic boilerplate with no grounding in this request ("what's the timeline?" with nothing behind it).
- Anything answerable from what the user already said.
- Multi-part mush (bundle of 3 questions in one); ask them separately or cut.
- Leading/rhetorical questions, or questions whose only purpose is to inflate the count.
- Re-asking, rephrasing, or near-duplicates of answered questions.

Each role's SKILL.md states this bar explicitly and instructs a self-filter pass:
*generate candidates, then drop every candidate that fails a test before showing the round.*

## `pedantic-pm` question domains

Organizing lens for all of these: *"Why does this matter in the market and for users?"*

- **Product:** problem / JTBD, target user & segment, success metrics / KPIs, MVP scope & explicit cuts, prioritization (what's v1 vs later), alternatives & competition, pricing / business model, roadmap fit, non-goals, stakeholders & sign-off.
- **UX:** primary user flows, entry points, every state (empty / loading / error / edge), accessibility, responsive / device coverage, copy & tone, onboarding & first-run, friction points, edge personas, internationalization, feedback & affordances.

## `pedantic-team` orchestrator behavior

1. Classify the request (clear / partially specified / dangerously ambiguous / conflicting).
2. Run the Relentless Rounds protocol with questions drawn from **all** role domains, grouped by lens: **Product / UX / Engineering**.
3. Each round mixes lenses; follow-ups inherit the lens of the answer they probe.
4. Same stop condition + forced-assumptions block as the protocol.

## File layout / changes

```
.claude/skills/
  pedantic-engineer/SKILL.md     (unchanged)
  pedantic-pm/SKILL.md           (NEW — self-contained: frontmatter + PM persona + domains + protocol + output contract)
  pedantic-team/SKILL.md         (NEW — self-contained orchestrator)
skill/
  pm-question-bank.md            (NEW — product + UX taxonomy, human reference)
  interrogation-protocol.md      (NEW — the Relentless Rounds spec, shared reference)
  (existing engineer files unchanged)
evals/
  test-cases.md / golden-examples.md  (ADD pm + team cases)
examples/
  pm-vague-feature.md            (NEW — e.g. "add notifications" → PM interrogation)
  team-combined-interrogation.md (NEW — same input → full team grilling)
README.md                        (REFRAME → The Pedantic Pandemic + roster + role table)
CLAUDE.md                        (REFRAME → team overview)
scripts/validate.sh              (EXTEND → verify all 3 SKILLs load: frontmatter + self-contained body)
```

Each `SKILL.md` is self-contained (valid YAML frontmatter `name` + `description`,
persona + protocol inlined) so it works invoked alone; `skill/*.md` are human
reference, not required at runtime.

## Decisions

- Git repo stays named `pedantic-engineer` (remote: `AlienWalker1995/pedantic-engineer`); brand reframed internally to "The Pedantic Pandemic." Rename deferred (optional, avoids remote-rename friction).
- Existing `pedantic-engineer` skill content is left as-is.
- Contagion theme is flavor only — it must never reduce question quality or clarity.

## Out of scope (YAGNI)

- No additional roles yet (designer, QA, data) — the framework leaves room but we add only PM now.
- No automation that *answers* its own questions; the skills only generate questions and track state.
- No repo/GitHub rename in this pass.
