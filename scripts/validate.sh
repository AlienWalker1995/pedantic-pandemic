#!/bin/bash
# validate.sh — Lightweight checks for required files and headings
# Usage: bash scripts/validate.sh

set -e

ERRORS=0
WARNINGS=0

check_file() {
    local file="$1"
    local desc="$2"
    if [ -f "$file" ]; then
        echo "✓ $desc: $file"
    else
        echo "✗ $desc: $file (MISSING)"
        ERRORS=$((ERRORS + 1))
    fi
}

check_heading() {
    local file="$1"
    local heading="$2"
    if grep -q "^# $heading" "$file" 2>/dev/null; then
        echo "  ✓ Heading found: $heading"
    else
        echo "  ✗ Heading missing: $heading"
        ERRORS=$((ERRORS + 1))
    fi
}

echo "=== Pedantic Engineer Validation ==="
echo ""

# Check required files
echo "--- Required Files ---"
check_file "README.md" "README"
check_file "CLAUDE.md" "CLAUDE.md"
check_file ".gitignore" ".gitignore"
check_file "docs/overview.md" "docs/overview.md"
check_file "docs/decision-log.md" "docs/decision-log.md"
check_file "docs/assumptions.md" "docs/assumptions.md"
check_file "docs/design-principles.md" "docs/design-principles.md"
check_file "docs/usage-patterns.md" "docs/usage-patterns.md"
check_file "skill/system-prompt.md" "skill/system-prompt.md"
check_file "skill/behavior-spec.md" "skill/behavior-spec.md"
check_file "skill/question-framework.md" "skill/question-framework.md"
check_file "skill/refusal-and-assumption-policy.md" "skill/refusal-and-assumption-policy.md"
check_file "skill/examples.md" "skill/examples.md"
check_file "evals/rubric.md" "evals/rubric.md"
check_file "evals/test-cases.md" "evals/test-cases.md"
check_file "evals/golden-examples.md" "evals/golden-examples.md"
check_file "scripts/validate.sh" "scripts/validate.sh"
check_file "examples/vague-feature-request.md" "examples/vague-feature-request.md"
check_file "examples/ambiguous-bug-report.md" "examples/ambiguous-bug-report.md"
check_file "examples/under-specified-refactor.md" "examples/under-specified-refactor.md"
check_file "examples/architecture-review.md" "examples/architecture-review.md"

echo ""
echo "--- Required Headings ---"

# Check key headings in critical files
echo "CLAUDE.md:"
check_heading "CLAUDE.md" "Pedantic Engineer"

echo "skill/system-prompt.md:"
check_heading "skill/system-prompt.md" "The Pedantic Engineer"

echo "skill/behavior-spec.md:"
check_heading "skill/behavior-spec.md" "Behavior Specification"

echo "skill/question-framework.md:"
check_heading "skill/question-framework.md" "Question Framework"

echo "evals/rubric.md:"
check_heading "evals/rubric.md" "Evaluation Rubric"

echo "evals/test-cases.md:"
check_heading "evals/test-cases.md" "Test Cases"

echo "evals/golden-examples.md:"
check_heading "evals/golden-examples.md" "Golden Examples"

echo ""
echo "--- Summary ---"
echo "Errors: $ERRORS"
echo "Warnings: $WARNINGS"

if [ $ERRORS -gt 0 ]; then
    echo "FAIL: $ERRORS required items missing"
    exit 1
else
    echo "PASS: All required files and headings present"
    exit 0
fi
