# Example — `/pedantic-team` on a vague feature request

**Input:** "Let's add notifications."

---

**The Pedanticism — Round 1**
Classification: **dangerously ambiguous** (no user, no goal, no channel, no technical surface)

The whole team has questions. Quick-pick (`1b, 4a, 7c …`); free-text any with `N: …`. Each lens asks only what it owns — nothing duplicated across lenses.

## 🔧 Engineering — why does it matter technically?
1. Does an event source for these notifications already exist?
   a) yes, there's an activity/events stream to hook   b) no, it must be built   c) unsure
2. Delivery transport?
   a) integrate existing provider (APNs/FCM/web-push)   b) build transport   c) email only (SMTP)
3. Fan-out scale per event?
   a) 1:1 (just the actor)   b) 1:few   c) 1:many (needs a queue)
4. Read/unread state lives where?
   a) new table/store   b) existing user model   c) client-only

## 📈 Product — why does it matter in the market?
5. Core job for the user?
   a) re-engagement   b) time-sensitive alerts   c) reduce anxiety   d) drive an action
6. Metric that proves it?
   a) 7-day return rate   b) task completion   c) CTR
7. Thinnest v1?
   a) one event type, one channel   b) a few types   c) full prefs from day one

## 🎨 UX — why does it matter for users?
8. Channel for v1?
   a) in-app   b) push   c) push + in-app   d) email
9. On tap, land where?
   a) the item in context   b) generic inbox   c) home

*(Reply with picks, or "stop"/"proceed" for the forced-assumptions block.)*

---

**User:** `5a, 7a, 8c — and there's no reply feature yet`

---

**The Pedanticism — Round 2**
Classification: partially specified — **contradiction surfaced**

⚠️ You chose re-engagement (5a) + thinnest v1 (7a), but "no event source yet" (1) means v1 must *also* build the event that triggers the notification — and a single new event may fire too rarely to move re-engagement. Probing that:

## 🔧 Engineering
10. Given the event source is net-new, what's the v1 trigger?
    a) reuse an existing action (e.g. mentions/likes) as the event   b) build a new event   c) defer until the source exists
11. Device-token capture + provider integration today?
    a) exists   b) net-new infra for v1   c) unsure

## 📈 Product
12. If the trigger is rare, does re-engagement still hold as the goal?
    a) yes, accept low frequency   b) add more event types to v1   c) switch goal to alerts (5b)

## 🎨 UX
13. Batching when many fire at once?
    a) one push each   b) batched   c) digest

*(Picks, or "stop" for assumptions.)*

---

This is the value: in two rounds the team exposed a **product↔engineering mismatch**
(re-engagement needs frequency; the only available event is rare and net-new) that
neither lens alone would have caught — before any code was written.
