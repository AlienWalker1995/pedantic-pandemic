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

echo "=== The Pedantic Pandemic — Validation ==="

check_skill() {
    local slug="$1"
    local skill=".claude/skills/$slug/SKILL.md"
    echo "• /$slug"
    if [ ! -f "$skill" ]; then
        fail "MISSING skill: $skill — /$slug will not exist"; return
    fi
    ok "present: $skill"
    if [ "$(head -n 1 "$skill")" = "---" ]; then
        ok "YAML frontmatter opens on line 1"
    else
        fail "$slug: does not start with '---' — Claude Code will NOT discover it"
    fi
    local fm; fm="$(awk 'NR>1 && /^---[[:space:]]*$/{exit} NR>1{print}' "$skill")"
    echo "$fm" | grep -q '^name:[[:space:]]*\S' && ok "$slug: frontmatter has name:" || fail "$slug: frontmatter missing name:"
    echo "$fm" | grep -q '^description:[[:space:]]*\S' && ok "$slug: frontmatter has description:" || fail "$slug: frontmatter missing description:"
    local body_lines; body_lines="$(awk 'c==2{print} /^---[[:space:]]*$/{c++}' "$skill" | grep -c '[^[:space:]]')"
    if [ "${body_lines:-0}" -ge 30 ]; then
        ok "$slug: self-contained body ($body_lines non-blank lines)"
    else
        fail "$slug: body too thin ($body_lines lines) — likely a pointer stub"
    fi
}

# Cursor loads rules from .cursor/rules/*.mdc with YAML frontmatter (description +
# alwaysApply). These are generated from the SKILL.md by scripts/sync-cursor.sh.
check_cursor() {
    local slug="$1"
    local rule=".cursor/rules/$slug.mdc"
    echo "• cursor: /$slug"
    if [ ! -f "$rule" ]; then
        fail "MISSING cursor rule: $rule — run scripts/sync-cursor.sh"; return
    fi
    ok "present: $rule"
    if [ "$(head -n 1 "$rule")" = "---" ]; then
        ok "$slug.mdc: frontmatter opens on line 1"
    else
        fail "$slug.mdc: does not start with '---' — Cursor will NOT load it"
    fi
    local fm; fm="$(awk 'NR>1 && /^---[[:space:]]*$/{exit} NR>1{print}' "$rule")"
    echo "$fm" | grep -q '^description:[[:space:]]*\S' && ok "$slug.mdc: frontmatter has description:" || fail "$slug.mdc: frontmatter missing description:"
    echo "$fm" | grep -qE '^alwaysApply:[[:space:]]*(true|false)' && ok "$slug.mdc: has alwaysApply:" || fail "$slug.mdc: missing alwaysApply:"
}

echo ""
echo "--- Skill loadability (the part that actually matters) ---"
for slug in pedantic-pm pedantic-ux pedantic-frontend pedantic-engineer pedantic-devops pedantic-team; do
    check_skill "$slug"
done

echo ""
echo "--- Cursor rules (valid in Cursor too — .cursor/rules/*.mdc) ---"
for slug in pedantic-pm pedantic-ux pedantic-frontend pedantic-engineer pedantic-devops pedantic-team; do
    check_cursor "$slug"
done

echo ""
echo "--- Supporting files ---"
check_file "README.md"
check_file "CLAUDE.md"
check_file ".gitignore"
for f in overview decision-log assumptions design-principles usage-patterns; do
    check_file "docs/$f.md"
done
for f in system-prompt behavior-spec question-framework refusal-and-assumption-policy examples \
         pm-question-bank ux-question-bank frontend-question-bank devops-question-bank interrogation-protocol; do
    check_file "skill/$f.md"
done
for f in rubric test-cases golden-examples; do
    check_file "evals/$f.md"
done
for f in vague-feature-request ambiguous-bug-report under-specified-refactor architecture-review \
         pm-vague-feature team-combined-interrogation; do
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
