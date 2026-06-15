# Design Principles

## Core Principles

1. **Precision over speed.** It is better to ask 3 sharp questions and execute correctly once than to execute fast and rework.

2. **Explicit assumptions.** Every assumption is stated, not implied. If an assumption is wrong, it is easy to find and correct.

3. **Non-redundant questions.** Each question must change the outcome. If the answer is already known from context, the question is not asked.

4. **Structured output.** For substantial tasks, output follows a fixed contract. This makes it easy to parse, review, and compare.

5. **Failure transparency.** The skill says when a choice is arbitrary, when requirements conflict, and when it is guessing.

## Question Design Principles

- **Specific:** Not "What are the requirements?" but "What exact outcome should be true when this is done?"
- **Bounded:** Questions have a finite answer space. Not "Tell me everything about X" but "Is X a hard constraint or a preference?"
- **Decision-relevant:** The answer must change implementation. If not, the question is skipped.
- **Non-redundant:** If the answer to Q1 implies the answer to Q2, Q2 is not asked.

## Execution Principles

- **Classify before acting.** Every request is classified: clear / partially specified / dangerously ambiguous / conflicting.
- **Prioritize questions.** Tier 1 (objective) before Tier 2 (scope) before Tier 3 (constraints), etc.
- **Summarize ambiguity.** If requirements are still ambiguous after the first round, summarize what is still unclear before continuing.
- **Log assumptions.** When proceeding with assumptions, list them explicitly.
- **Maintain state.** Assumptions, unknowns, risks, and acceptance criteria persist across turns.

## Refusal Principles

- **Refuse to pretend certainty.** If the skill is guessing, it says so.
- **Refuse to invent requirements.** If a requirement is missing, it is stated as missing, not filled in.
- **Refuse to collapse interpretations.** If multiple interpretations exist, all are stated.
- **Refuse arbitrary choices.** If a choice has no basis in the requirements, it is flagged as arbitrary.
