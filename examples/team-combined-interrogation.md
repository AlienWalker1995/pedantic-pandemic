# Example — `/pedantic-team` on a vague feature request

**Input:** "Let's add notifications."

---

**🦠 The Pedantic Pandemic — Round 1**
Classification: **dangerously ambiguous** (no user, no goal, no channel, no surface)

A feature with no reason, no user, and no technical surface named. The whole team has questions. Each lens asks only what it owns; nothing is duplicated across lenses.

## 🔧 Engineering — why does it matter technically?
1. What event source fires a notification — is there already an events/activity stream, or does one need to be built?
2. Delivery: are we integrating an existing push provider (APNs/FCM/web-push) or building transport? What's already in the stack?
3. Fan-out shape: one event → how many recipients? Does this need a queue, or is synchronous send fine at current scale?
4. What's the data model for "read/unread" state, and where does it live?
5. Idempotency/dedupe: how do we guarantee a user isn't notified twice for the same event on retries?

## 📈 Product — why does it matter in the market?
6. What problem does this solve that users feel today? Painkiller or vitamin?
7. Who's the first target user, and what single metric proves it worked?
8. What's the thinnest v1 (one event type) that still tests demand?
9. Why now, over the rest of the roadmap?

## 🎨 UX — why does it matter for users?
10. What's the first notification a user ever gets, and what action should it drive?
11. Which channel matters most for v1 — in-app, push, email?
12. Empty state and per-type controls — all-or-nothing, or granular in v1?
13. On tap, where does the user land?

*(Answer any subset. The team keeps going until you say stop.)*

---

**User:** "Re-engagement. Push + in-app. v1 = 'someone replied to you.'"

---

**🦠 The Pedantic Pandemic — Round 2**
Classification: partially specified — **one contradiction surfaced** (see below)

⚠️ Contradiction: re-engagement goals usually need *high notification frequency*, but a single "reply" event may fire rarely — the engineering fan-out and the product goal may be mismatched. Probing that:

## 🔧 Engineering
1. Does a "reply" event already exist in the system to hook, or is the reply feature itself not built yet? (Determines whether this is a 1-day or 3-week build.)
2. For push, do we have device-token capture + a provider integration today, or is that net-new infra for v1?

## 📈 Product
3. What's the current daily reply volume per active user? If it's <1/week, will "someone replied" actually move re-engagement, or do we need more event types in v1?
4. Baseline re-engagement rate today and the lift that makes this worth maintaining?

## 🎨 UX
5. On tap, deep-link to the specific reply in context, or a generic inbox? (Biggest lever on the re-engagement metric.)
6. Batching: 12 replies in an hour → 12 pushes, one batched, or a digest?

*(Say "stop"/"proceed" for the forced-assumptions block.)*

---

This is the value: in two rounds the team exposed a **product↔engineering mismatch**
(re-engagement needs frequency; the chosen event may be rare) that neither lens alone
would have caught — before any code was written.
