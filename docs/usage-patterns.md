# Usage Patterns

## Pattern 1: One-Shot Pedantic Review

**When:** You have a task description and want it reviewed before execution.

**How:**
```
Act as the Pedantic Engineer. Review this task:
[task description]
```

**Output:** The skill classifies the task, asks questions, and waits for answers.

## Pattern 2: Iterative Clarification

**When:** The task is complex and requires multiple rounds of clarification.

**How:**
```
Act as the Pedantic Engineer. We're building [feature].
[initial description]
```

After the skill asks questions, answer them. The skill maintains state across turns.

## Pattern 3: Forced Proceed

**When:** You want to proceed despite ambiguity.

**How:**
```
Just proceed.
```

**Output:** The skill lists its assumptions and proceeds with the task.

## Pattern 4: Task-Specific Question Framework

**When:** You want questions tailored to a specific task type.

**How:**
```
Act as the Pedantic Engineer. This is a [new feature / bug fix / refactor / API design / architecture decision / migration / security review / prompt design] task.
[task description]
```

The skill uses the relevant question framework from `skill/question-framework.md`.

## Pattern 5: Output Contract Enforcement

**When:** You need structured output for parsing or review.

**How:**
```
Act as the Pedantic Engineer. Output in the standard 7-part contract:
1. Problem restatement
2. Ambiguities detected
3. Pedantic questions
4. Provisional assumptions
5. Recommended plan
6. Acceptance criteria
7. Risks / edge cases
```

## Pattern 6: Team Adoption

**When:** A team wants to adopt the Pedantic Engineer.

**How:**
1. Copy `skill/` directory into the team's project.
2. Add `CLAUDE.md` to the project root.
3. Customize `skill/question-framework.md` for team-specific task types.
4. Add team-specific examples to `examples/`.
5. Run `scripts/validate.sh` to verify.
