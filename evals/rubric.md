# Evaluation Rubric

## Scoring Dimensions

Each dimension is scored 1-5. Overall score is the average.

### 1. Ambiguity Detection (25%)
- **5:** Detects all ambiguities, including subtle ones (implicit assumptions, unstated constraints)
- **4:** Detects most ambiguities, misses 1-2 subtle ones
- **3:** Detects obvious ambiguities, misses moderate ones
- **2:** Detects only the most obvious ambiguities
- **1:** Misses most ambiguities, proceeds with too many assumptions

### 2. Question Relevance (25%)
- **5:** Every question changes the outcome. No filler questions.
- **4:** Most questions are relevant. 1-2 questions could be derived from context.
- **3:** Some questions are relevant. Several questions are filler or redundant.
- **2:** Many questions are filler. Few questions change the outcome.
- **1:** Questions are mostly irrelevant or already answered from context.

### 3. Non-Redundancy (15%)
- **5:** No duplicate questions. Each question adds new information.
- **4:** 1-2 redundant questions. Mostly non-redundant.
- **3:** Several redundant questions. Some add value.
- **2:** Many redundant questions. Hard to distinguish from filler.
- **1:** Questions repeat the same information multiple times.

### 4. Assumption Transparency (15%)
- **5:** All assumptions are explicit, labeled, and include impact analysis.
- **4:** Most assumptions are explicit. 1-2 assumptions lack impact analysis.
- **3:** Some assumptions are explicit. Several assumptions are implicit.
- **2:** Few assumptions are explicit. Many assumptions are implicit.
- **1:** Assumptions are not labeled. Impact is not analyzed.

### 5. Engineering Rigor (10%)
- **5:** Checks for hidden coupling, backward compatibility, data shapes, naming, security, observability, rollback, testability, maintenance.
- **4:** Checks for most engineering concerns. Misses 1-2 areas.
- **3:** Checks for some engineering concerns. Misses several areas.
- **2:** Checks for few engineering concerns.
- **1:** No engineering rigor. Proceeds without checking coupling, compatibility, etc.

### 6. Actionability (10%)
- **5:** Output is structured, specific, and actionable. User knows exactly what to do next.
- **4:** Output is mostly structured and actionable. 1-2 areas are vague.
- **3:** Output is somewhat structured. Some areas are vague.
- **2:** Output is unstructured. Hard to know what to do next.
- **1:** Output is vague and unactionable.

## Scoring Example

**Input:** "Build a login page."

**Ambiguity Detection:** 3/5 — Detects missing auth method, but misses session management
**Question Relevance:** 4/5 — Good questions about auth method, session, error handling
**Non-Redundancy:** 5/5 — No duplicate questions
**Assumption Transparency:** 2/5 — Assumes JWT without stating it
**Engineering Rigor:** 3/5 — Checks security, misses observability
**Actionability:** 4/5 — Clear next steps, but missing session management details

**Overall: 3.5/5**
