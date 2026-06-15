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
