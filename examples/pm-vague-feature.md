# Example — `/pedantic-pm` on a vague feature request

**Input:** "Let's add notifications."

---

**🦠 The Pedantic PM — Round 1**

That's a feature, not a reason. Before any of it: *why does this matter for users and the market?* Nothing below is about how to build it — only whether it should exist and what it is.

## Product
1. What user problem do notifications solve — what are users missing or forgetting today without them?
2. Who is the first target user for this (new users, power users, admins)? Who is it explicitly NOT for in v1?
3. What's the one metric that proves notifications worked — re-engagement rate, task completion, DAU? What's the target?
4. What counter-metric would tell us notifications are hurting us (unsubscribe rate, app-uninstalls, mutes)?
5. Is this a painkiller (users are actively losing value without it) or a vitamin (nice-to-have)? What's the evidence?
6. What's the thinnest v1 — one notification type for one event — that would still test whether users want this at all?
7. Why now, over everything else on the roadmap?

## UX
8. What's the *first* notification a user should ever receive, and what action should it drive?
9. Which channels — in-app, push, email, SMS? Which one matters most for v1?
10. Can users control what they get (granular prefs, mute, digest), or is it all-or-nothing in v1?
11. What does the "no notifications yet" empty state say?
12. What happens to a notification after it's read — does it persist, archive, disappear?

*(Answer any subset. I'll keep going until you say stop.)*

---

**User answers:** "Re-engagement — bring users back. Push + in-app. Metric is 7-day return rate. v1 is just 'someone replied to you.'"

---

**🦠 The Pedantic PM — Round 2**

Good — "someone replied to you" + push for re-engagement. That opens several new questions; each one below is *earned* by what you just said.

## Product
1. If the goal is 7-day return rate, what's the baseline today, and what lift would make this worth maintaining?
2. "Someone replied" implies a social/threaded surface exists — is reply volume high enough that this fires often enough to move re-engagement? What's the current daily reply count per active user?
3. Could this *backfire* — users muting push entirely after the first reply notification, killing the channel for future features? How will we know?

## UX
4. On tapping the push, where does the user land — the specific reply in context, or a generic inbox? (Landing on the wrong place is the #1 re-engagement killer.)
5. If a user gets 12 replies in an hour, do they get 12 pushes, one batched push, or a digest? What's the threshold?
6. For a user who has push disabled at the OS level, what's the in-app fallback so they still see the reply?
7. What does the notification copy literally say — "Alex replied to your post" vs "You have a new reply"? (Named senders re-engage far better — is the sender's identity available at send time?)

*(Still going. Say "stop" / "proceed" when you've had enough and I'll hand you the forced-assumptions block.)*

---

**User:** "stop — just do v1"

---

**🦠 The Pedantic PM — Forced assumptions (you chose to proceed)**

## Assumptions I'm forced to make
- [assumed] v1 = push + in-app, single type ("X replied to you"), no granular prefs beyond a global mute — *if wrong:* prefs become a v1 requirement, larger scope.
- [assumed] Tapping a notification deep-links to the specific reply in context — *if wrong:* re-engagement lift will likely underperform the target.
- [inferred] Sender display name is available at send time for the copy — *if wrong:* copy falls back to generic and CTR drops.
- [assumed] Batching threshold can ship as a fast-follow, not v1 — *if wrong:* heavy repliers get spammed and mute.

## Still open
- Baseline 7-day return rate + target lift (no number given).
- OS-push-disabled fallback behavior.
- Counter-metric + guardrail for mass-mute.
