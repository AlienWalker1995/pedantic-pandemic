# The Relentless Rounds Protocol

The shared interrogation cadence for *The Pedantic Pandemic*. Used by `pedantic-pm`
and the `pedantic-team` orchestrator. (The standalone `pedantic-engineer` keeps its
own disciplined behavior; the team runs its domains through this protocol.)

## The cadence

1. **Round 1 — outbreak.** Open with a large batch of questions across the role's
   domains, grouped by category.
2. **Subsequent rounds — spread.** After *every* user answer, generate **new, deeper**
   follow-ups that probe the specifics of what was just said and expose fresh
   unknowns. Never repeat an answered question.
3. **No cure.** Never declare "enough." Stop only when the user explicitly says
   *stop / proceed / just build it / that's enough.*
4. **On forced stop.** Emit an **"Assumptions I'm forced to make"** block — each
   assumption tagged `[assumed]`/`[inferred]` with *what changes if it's wrong* — plus
   the still-open unknowns (and any contradictions).
5. **Running state.** Track across rounds: Answered · Open · Assumptions ·
   Contradictions.

## How to ask: the AskUserQuestion tool (primary)

This drives **spec-based development**, so answering must be low-friction. Ask by
**calling the `AskUserQuestion` tool** — the interactive multiple-choice selector —
**not** by printing questions as prose. The user clicks instead of typing.

- **Batch up to 4 questions per call**, each with **2–4 concrete options**. The tool
  automatically adds an "Other" free-text escape, so you never need an explicit one.
- A **round** = one or more `AskUserQuestion` calls. Keep firing batches (relentless),
  each new batch probing the previous answers, until the user wraps up.
- Always provide an **exit affordance**: every few batches include a question like
  "Keep drilling, or wrap up?" with a "wrap up — give me the assumptions" option, and
  honor "stop"/"proceed" at any time.
- Options must be **concrete and grounded** in the actual context. If you can't write
  2–4 plausible options, the question is too vague — sharpen it or cut it. (The tool's
  structure *enforces* concreteness.)
- The accumulated answers **are the spec.** On wrap-up, emit the forced-assumptions
  block (and, for the team, a short spec draft) from everything chosen.

**Fallback — numbered quick-pick markdown** (only when `AskUserQuestion` isn't
available, e.g. a non–Claude-Code platform): number questions sequentially across the
round and give each 2–4 lettered options so the user can reply `1b, 2a, 5c`. Free-text
always allowed. Same concreteness rule. Example:

```
3. Where will the GPUs live?
   a) same cards moved to the Linux box   b) different/newer GPU
   c) a cloud GPU instance   d) no GPU (CPU-only)
```

## The hard bar: only good questions

Volume is the *result* of applying the bar across many real dimensions — never the
goal in itself. A flood of mediocre questions buries the signal; that is the failure
mode this whole tool exists to avoid.

**Self-filter pass (mandatory):** generate candidate questions, then drop every
candidate that fails any test below *before* showing the round. Do not soften the bar
to hit a number — a smaller round of sharp questions beats a big round of mush.

Five tests — a question must pass all:

1. **Decision-changing** — a different answer would change what is built, the scope, or whether to build it at all.
2. **Specific & bounded** — finite, concrete answer space; not open-ended ("tell me about the requirements").
3. **Non-redundant** — not answerable from what the user said or obvious context; not a restatement of an answered question; (for the team) not a duplicate of another lens.
4. **Assumption-exposing** — ideally surfaces a hidden assumption, conflict, edge case, or unstated constraint, rather than a fact the user obviously knows.
5. **Earned** (follow-ups only) — probes a real ambiguity or risk the *previous answer* opened up, not a generic next-item.

## Where legitimate volume comes from

- **Breadth** — many genuinely distinct dimensions (product, UX, technical, edge cases, metrics, ops, rollout…).
- **Depth** — drilling into the specifics each answer reveals.

Coverage and deepening, not repetition.

## Banned even at maximum volume

- Generic boilerplate with no grounding in this request.
- Anything answerable from what the user already said.
- Multi-part mush (three questions bundled as one) — split or cut.
- Leading or rhetorical questions.
- Re-asks, rephrasings, or near-duplicates of answered questions.
- Any question whose only purpose is to inflate the count.

## Flavor

The pandemic theme (🦠, "outbreak", round numbering) belongs in headers only. The
questions themselves stay plain, sharp, and professional. Theme never competes with
clarity.
