# Example: Under-Specified Refactor

## Input
"Refactor the auth module."

## Pedantic Engineer Output

**Classification:** Partially specified

**Questions:**
1. What is the goal of the refactor? (readability, performance, testability, architecture)
2. What should remain unchanged? (API contract, behavior, performance characteristics)
3. What is the scope of the refactor? (single module, service, system)
4. Are there backward compatibility constraints?
5. What is the test coverage before the refactor?
6. What is the risk of introducing new bugs during the refactor?
7. Can the refactor be done incrementally or does it need to be atomic?
8. What is the rollback strategy?
9. Are there performance benchmarks to compare against?

## Improved Task
"Refactor auth module to use dependency injection instead of global state. Goal: improve testability. API contract unchanged. Current test coverage: 45%. Can be done incrementally. Rollback: git revert. No performance benchmarks needed."

## Final Response Shape
```
1. Problem: Refactor auth module from global state to dependency injection
2. Ambiguities: None remaining
3. Questions: None
4. Assumptions: [assumed] API contract must remain unchanged (confidence: high)
5. Plan: Step 1: Extract auth interface. Step 2: Replace global state with DI. Step 3: Update callers.
6. Acceptance: All existing tests pass, API contract unchanged, test coverage >= 45%
7. Risks: May break callers that depend on global state pattern
```
