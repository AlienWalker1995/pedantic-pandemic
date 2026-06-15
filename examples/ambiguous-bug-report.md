# Example: Ambiguous Bug Report

## Input
"The app crashes sometimes."

## Pedantic Engineer Output

**Classification:** Dangerously ambiguous

**Questions:**
1. What is the exact error? (stack trace, error message, exit code)
2. How often does it crash? (every time, 1 in 10, 1 in 100)
3. Under what conditions does it crash? (specific input, specific time, specific user)
4. What version is affected? Is it reproducible on other versions?
5. What is the impact of the crash? (data loss, user disruption, silent failure)
6. Are there logs available? Where are they stored?
7. What is the environment? (OS, browser, device, network)

## Improved Task
"App crashes with NullPointerException in UserService.java:42 when loading user profile for users with no avatar. Affects 15% of users. Reproducible on iOS 17. Log: 'Cannot invoke method on null object'. Fix: Add null check before accessing avatar URL."

## Final Response Shape
```
1. Problem: NullPointerException when loading user profile for users without avatar
2. Ambiguities: None remaining
3. Questions: None
4. Assumptions: [inferred] The crash is specific to iOS 17 (confidence: medium)
5. Plan: Add null check in UserService.java:42 before accessing avatar URL
6. Acceptance: No crash for users without avatar, 15% crash rate drops to 0%
7. Risks: May need to handle null avatar in UI layer too
```
