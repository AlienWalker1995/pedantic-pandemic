#!/bin/bash
# validate.sh — Structural + skill-loadability checks for the pedantic-engineer repo.
# Usage: bash scripts/validate.sh
#
# This goes beyond "file exists": it verifies the skill is actually loadable by
# Claude Code (correct location + valid YAML frontmatter with name/description),
# since a missing-frontmatter SKILL.md is silently undiscoverable.

set -u

ERRORS=0

fail() { echo "  ✗ $1"; ERRORS=$((ERRORS + 1)); }
ok()   { echo "  ✓ $1"; }

check_file() {
    if [ -f "$1" ]; then ok "file: $1"; else fail "MISSING file: $1"; fi
}

check_heading() {
    if grep -q "^#\{1,3\} $2" "$1" 2>/dev/null; then
        ok "heading in $1: $2"
    else
        fail "heading missing in $1: $2"
    fi
}

echo "=== Pedantic Engineer Validation ==="

echo ""
echo "--- Skill loadability (the part that actually matters) ---"
SKILL=".claude/skills/pedantic-engineer/SKILL.md"
if [ -f "$SKILL" ]; then
    ok "skill present at canonical location: $SKILL"
    # Frontmatter must start on line 1 and contain name + description.
    if [ "$(head -n 1 "$SKILL")" = "---" ]; then
        ok "YAML frontmatter opens on line 1"
    else
        fail "SKILL.md does not start with '---' — Claude Code will NOT discover it"
    fi
    fm="$(awk 'NR>1 && /^---[[:space:]]*$/{exit} NR>1{print}' "$SKILL")"
    echo "$fm" | grep -q '^name:[[:space:]]*\S' && ok "frontmatter has name:" || fail "frontmatter missing name:"
    echo "$fm" | grep -q '^description:[[:space:]]*\S' && ok "frontmatter has description:" || fail "frontmatter missing description:"
    # The skill body should be self-contained, not just a pointer to another file.
    body_lines="$(awk 'c==2{print} /^---[[:space:]]*$/{c++}' "$SKILL" | grep -c '[^[:space:]]')"
    if [ "${body_lines:-0}" -ge 30 ]; then
        ok "skill body is self-contained ($body_lines non-blank lines)"
    else
        fail "skill body too thin ($body_lines lines) — likely a pointer stub, not a working skill"
    fi
else
    fail "MISSING skill: $SKILL — the /pedantic-engineer command will not exist"
fi

echo ""
echo "--- Supporting files ---"
check_file "README.md"
check_file "CLAUDE.md"
check_file ".gitignore"
for f in overview decision-log assumptions design-principles usage-patterns; do
    check_file "docs/$f.md"
done
for f in system-prompt behavior-spec question-framework refusal-and-assumption-policy examples; do
    check_file "skill/$f.md"
done
for f in rubric test-cases golden-examples; do
    check_file "evals/$f.md"
done
for f in vague-feature-request ambiguous-bug-report under-specified-refactor architecture-review; do
    check_file "examples/$f.md"
done

echo ""
echo "--- Key headings ---"
check_heading "skill/system-prompt.md" "The Pedantic Engineer"
check_heading "skill/behavior-spec.md" "Behavior Specification"
check_heading "skill/question-framework.md" "Question Framework"
check_heading "evals/rubric.md" "Evaluation Rubric"
check_heading "evals/golden-examples.md" "Golden Examples"

echo ""
echo "--- Summary ---"
if [ "$ERRORS" -gt 0 ]; then
    echo "FAIL: $ERRORS problem(s) found"
    exit 1
else
    echo "PASS: skill is loadable and all supporting files present"
    exit 0
fi
