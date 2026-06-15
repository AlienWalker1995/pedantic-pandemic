# Assumptions

## Setup Assumptions

1. **GitHub CLI not available:** `gh` is not installed in this environment. The repo is initialized locally. To create a private remote, run:
   ```bash
   gh repo create kawalyn/pedantic-engineer --private
   cd pedantic-engineer
   git remote add origin git@github.com:kawalyn/pedantic-engineer.git
   git push -u origin main
   ```

2. **Claude Code via npx:** Claude Code is available as `npx @anthropic-ai/claude-code`. Node.js v22.14.0 was installed locally.

3. **Language-agnostic:** The skill has no opinionated language stack. It works for Python, JavaScript, Go, Rust, TypeScript, etc.

4. **Ambiguity threshold = 0:** The skill stops and asks questions on ANY detected ambiguity, not just above a threshold.

5. **Assumption logging:** All assumptions are logged explicitly in the output. The skill never silently collapses multiple interpretations.

6. **Default branch = main:** Git initialized with `main` as the default branch.

7. **No authentication:** Claude Code is not authenticated (no API key). The skill works in print mode and interactive mode.

## Design Assumptions

1. **Questions should be decision-relevant:** Every question must change the outcome. If the answer doesn't affect implementation, it's not asked.

2. **Seven priority tiers:** Questions are organized into 7 tiers (objective, scope, constraints, interfaces, risk, testing, rollout). This is a fixed taxonomy.

3. **Output contract is fixed:** For substantial tasks, the skill always outputs in the 7-part structure (problem restatement → ambiguities → questions → assumptions → plan → acceptance criteria → risks).

4. **Failure policy is strict:** The skill refuses to invent requirements, pretends certainty, or silently collapse interpretations.

5. **Engineering checklist is comprehensive:** The skill checks for hidden coupling, backward compatibility, data shape assumptions, naming mismatches, permission/security implications, observability gaps, rollback strategy, testability, and maintenance burden.
