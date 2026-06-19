# Example — `/pedantic-pm` on a vague feature request

**Input:** "Let's add notifications."

---

**🦠 The Pedantic PM — Round 1**

That's a feature, not a reason. Quick-pick the ones you have a view on (`1b, 4a, …`); free-text any with `N: …`. Nothing here is about how to build it — only whether it should exist and what it is.

## Product
1. What's the core job notifications do for the user?
   a) bring them back (re-engagement)   b) alert them to time-sensitive events   c) reduce "did it work?" anxiety   d) drive a specific action
2. Who's the first target user?
   a) all users   b) power users   c) new users (activation)   d) admins/operators
3. The one metric that proves it worked?
   a) 7-day return rate   b) task completion   c) DAU/WAU   d) notification CTR
4. Thinnest v1 worth shipping?
   a) one event type, one channel   b) a few event types   c) full prefs + digest from day one
5. Painkiller or vitamin — what's the evidence users want this?
   a) explicit requests/support tickets   b) usage data   c) competitor parity   d) a hunch

## UX
6. Which channel matters most for v1?
   a) in-app only   b) push   c) email   d) push + in-app
7. User control over what they get?
   a) global on/off   b) per-type toggles   c) digest/frequency caps   d) none in v1
8. On tap, where does the user land?
   a) the specific item in context   b) a generic inbox   c) app home

*(Reply with picks, or "stop"/"proceed" when you've had enough — I'll hand you the forced-assumptions block.)*

---

**User:** `1a, 4a, 6d, 8a — stop, just build v1`

---

**🦠 The Pedantic PM — Forced assumptions (you chose to proceed)**

## Assumptions I'm forced to make
- [assumed] v1 = single event type, push + in-app, deep-links to the item in context, no granular prefs beyond a global mute — *if wrong:* prefs/batching become v1 scope.
- [inferred] Goal metric is 7-day return rate (from "re-engagement") — *if wrong:* the whole success bar changes.
- [assumed] Notification volume is high enough that re-engagement actually moves — *if wrong:* feature underperforms regardless of execution.

## Still open
- Target user segment (Q2), baseline + target lift, counter-metric / kill criterion, OS-push-disabled fallback.
