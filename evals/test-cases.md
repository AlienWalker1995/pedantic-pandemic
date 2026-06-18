# Test Cases

## Test Case 1: Simple Feature Request
**Input:** "Add a dark mode toggle."
**Expected:** Classify as partially specified. Ask about: storage mechanism (localStorage vs. cookie vs. server), scope (all pages or specific?), default behavior, transition animation.
**Pass Criteria:** At least 3 relevant questions asked. No filler questions.

## Test Case 2: Vague Bug Report
**Input:** "The app is slow."
**Expected:** Classify as dangerously ambiguous. Ask about: which page/action is slow, what is "slow" (threshold), is it consistent or intermittent, what is the baseline, what changed recently.
**Pass Criteria:** At least 4 relevant questions. Questions are specific and bounded.

## Test Case 3: Refactor with Implicit Constraints
**Input:** "Refactor the database layer."
**Expected:** Classify as partially specified. Ask about: goal of refactor, scope (which tables/models), backward compatibility, test coverage, deployment strategy.
**Pass Criteria:** Questions cover at least 4 of the 7 priority tiers.

## Test Case 4: API Design with Missing Contract
**Input:** "Design a REST API for users."
**Expected:** Classify as partially specified. Ask about: operations (CRUD?), auth method, request/response format, versioning, rate limiting, error format.
**Pass Criteria:** At least 5 relevant questions. Questions cover interfaces and constraints.

## Test Case 5: Architecture Decision with Trade-offs
**Input:** "Choose a database for the project."
**Expected:** Classify as partially specified. Ask about: data model (relational, document, graph), scale (rows, throughput), consistency requirements, team expertise, operational constraints.
**Pass Criteria:** Questions cover at least 5 priority tiers. Trade-offs are discussed.

## Test Case 6: Migration with Downtime Budget
**Input:** "Migrate from MySQL to PostgreSQL."
**Expected:** Classify as partially specified. Ask about: data volume, downtime budget, migration strategy, rollback strategy, validation steps, data transformations.
**Pass Criteria:** At least 5 relevant questions. Migration strategy is discussed.

## Test Case 7: Security Review with Compliance
**Input:** "Review the app for GDPR compliance."
**Expected:** Classify as partially specified. Ask about: data processed, data stored, data shared, consent mechanism, data retention, right to erasure, right to access, DPA status.
**Pass Criteria:** Questions cover at least 4 GDPR-specific areas.

## Test Case 8: Prompt Design with Constraints
**Input:** "Design a prompt for summarizing articles."
**Expected:** Classify as partially specified. Ask about: input format, output format, length constraints, language, tone, handling of missing information, evaluation criteria.
**Pass Criteria:** At least 4 relevant questions. Output format is specified.

## Test Case 9: Conflicting Constraints
**Input:** "Build a feature that loads in under 100ms and uses real-time ML inference."
**Expected:** Classify as conflicting constraints. Flag the conflict. Ask which constraint is hard vs. soft. Suggest alternatives (caching, pre-computation, model quantization).
**Pass Criteria:** Conflict is explicitly stated. At least 2 alternatives suggested.

## Test Case 10: No Acceptance Criteria
**Input:** "Make the dashboard better."
**Expected:** Classify as dangerously ambiguous. Ask about: what "better" means (faster, prettier, more features?), how success is measured, what is the current baseline, what is the target.
**Pass Criteria:** At least 3 questions. "Better" is decomposed into measurable criteria.

## Test Case 11: Adversarial Vague Prompt
**Input:** "Do the thing."
**Expected:** Classify as dangerously ambiguous. Ask about: what "the thing" refers to, context, scope, constraints, success criteria.
**Pass Criteria:** At least 4 questions. Questions are specific despite vague input.

## Test Case 12: Already-Specified Task
**Input:** "Add a null check to UserService.java:42 before accessing avatarUrl. The crash affects users without avatars. Reproducible on iOS 17. Fix: add null check."
**Expected:** Classify as clear enough to execute. Proceed directly. No questions asked.
**Pass Criteria:** No questions asked. Task is executed directly.

## Test Case 13: Multiple Interpretations
**Input:** "Add authentication."
**Expected:** Classify as partially specified. List interpretations: JWT, OAuth, session-based, API key, SSO. Ask which is intended.
**Pass Criteria:** At least 3 interpretations listed. Questions are bounded.

## Test Case 14: Hidden Coupling
**Input:** "Change the user email format from lowercase to mixed case."
**Expected:** Classify as partially specified. Ask about: downstream consumers (search, indexing, caching, email templates, validation), database constraints, existing data, migration strategy.
**Pass Criteria:** At least 3 hidden coupling areas identified.

## Test Case 15: Missing Observability
**Input:** "Add a new API endpoint for user profiles."
**Expected:** Classify as partially specified. Ask about: logging, metrics, tracing, error handling, monitoring alerts, documentation.
**Pass Criteria:** At least 3 observability questions asked.

---

# Pedantic PM cases (`/pedantic-pm` — product + UX only)

## PM-1: Vague feature, no user/why
**Input:** "Let's add notifications."
**Expected:** Round 1 with a large batch grouped Product / UX. Product covers problem/JTBD, target user, success metric + counter-metric, MVP cut, why-now. UX covers first notification, channel, controls, empty state, on-tap landing. NO engineering questions (data model, transport, queue) — those are out of scope for this role.
**Pass Criteria:** ≥10 questions, all pass the 5-test bar; zero implementation questions; at least one counter-metric / kill-criterion question.

## PM-2: Follow-ups are earned
**Input (round 2 after "re-engagement, push+in-app, v1=someone replied"):**
**Expected:** New follow-ups that probe *that specific answer* (reply frequency vs re-engagement goal, deep-link target, batching, named-sender copy). No re-asking of answered items.
**Pass Criteria:** Every round-2 question is traceable to the round-1 answer; no duplicates of answered questions.

## PM-3: Forced-stop produces assumptions
**Input:** user says "stop / just build v1"
**Expected:** Stops asking; emits "Assumptions I'm forced to make" (each + impact-if-wrong) and "Still open".
**Pass Criteria:** ≥3 explicit assumptions with impact; lists remaining unknowns rather than pretending certainty.

---

# Pedantic Team cases (`/pedantic-team` — orchestrator, all lenses)

## TEAM-1: Combined interrogation, no cross-lens dupes
**Input:** "Let's add notifications."
**Expected:** Round grouped Engineering / Product / UX. Engineering = event source, transport, fan-out, read-state model, dedupe. Product = problem, target, metric, MVP. UX = first notification, channel, controls, on-tap. No question repeated across lenses.
**Pass Criteria:** All three lenses present; ≥4 per lens; zero cross-lens duplicates; classification stated.

## TEAM-2: Surfaces a cross-lens contradiction
**Input (after "re-engagement; v1 = single rare 'reply' event"):**
**Expected:** Flags the product↔engineering mismatch (re-engagement needs frequency; a rare event may not deliver it) — something neither single lens would catch.
**Pass Criteria:** Explicitly names at least one contradiction/risk spanning two lenses.
