#!/usr/bin/env bash
# sync-cursor.sh — generate .cursor/rules/*.mdc from .claude/skills/*/SKILL.md
#
# Single source of truth is each Claude Code SKILL.md. This derives the Cursor
# equivalent: an "Agent Requested" rule (alwaysApply:false + a description Cursor
# matches against the task) whose body IS the SKILL.md body. The personas already
# describe a no-AskUserQuestion fallback, so they degrade cleanly to Cursor's
# plain-chat questioning.
#
# Run after editing any SKILL.md. Outputs are committed so Cursor users need no
# build step. scripts/validate.sh checks both runtimes.
set -eu
cd "$(dirname "$0")/.."

mkdir -p .cursor/rules
count=0
for skill in .claude/skills/*/SKILL.md; do
    slug=$(basename "$(dirname "$skill")")
    # description: single frontmatter line (everything after "description: ")
    desc=$(awk 'NR==1{next} /^---[[:space:]]*$/{exit} /^description:/{sub(/^description:[[:space:]]*/,""); print; exit}' "$skill")
    # body: everything after the closing frontmatter ---, verbatim (preserves md rules)
    body=$(awk 'fm>=2{print; next} /^---[[:space:]]*$/{fm++}' "$skill")
    out=".cursor/rules/$slug.mdc"
    {
        printf -- '---\n'
        printf 'description: %s\n' "$desc"
        printf 'globs:\n'
        printf 'alwaysApply: false\n'
        printf -- '---\n\n'
        printf '> **Cursor adapter** — generated from `%s` by `scripts/sync-cursor.sh`; do not edit by hand. Cursor has no `AskUserQuestion` tool, so use the numbered quick-pick markdown fallback this persona already describes (behavior is otherwise identical). Referenced `skill/*.md` files live in this repo.\n\n' "$skill"
        printf '%s\n' "$body"
    } > "$out"
    echo "  generated $out"
    count=$((count + 1))
done
echo "Synced $count Cursor rule(s) under .cursor/rules/ from .claude/skills/*/SKILL.md"
