#!/usr/bin/env bash
# Install the Pedantic Pandemic skills into one or more agent harnesses.
#
# Each .claude/skills/<persona>/ folder is one portable Agent Skill. The shared
# reference docs in skill/ are copied into every installed persona as skill/,
# so the `skill/*.md` paths the SKILL.md files mention resolve from the skill
# folder exactly as they do from the repo root. Nothing is rewritten per tool,
# so .claude/skills and skill/ stay the single source of truth.
#
# Usage: ./install.sh <agents|claude|hermes|all> [--project DIR] [--dry-run]
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$SRC/.claude/skills"
SHARED_DOCS="$SRC/skill"

usage() {
  cat <<USAGE
Usage: ./install.sh <agents|claude|hermes|all> [--project DIR] [--dry-run]

Install the six pedantic-* skills for one or more agent harnesses.

Targets:
  agents   ~/.agents/skills   Codex, Gemini CLI, Cursor, GitHub Copilot, OpenCode
  claude   ~/.claude/skills   Claude Code
  hermes   ~/.hermes/skills   Hermes
  all      every target above

Options:
  --project DIR   install into DIR/.agents/skills and DIR/.claude/skills instead
                  of your home directory (hermes has no project scope)
  --dry-run       print what would be copied without copying it
  --help          show this help

Re-running is safe: each installed skill folder is replaced with a fresh copy.
USAGE
}

TARGET=""
PROJECT_DIR=""
DRY_RUN=0

while [ $# -gt 0 ]; do
  case "$1" in
    agents|claude|hermes|all)
      TARGET="$1"
      ;;
    --project)
      if [ $# -lt 2 ]; then
        echo "install.sh: --project needs a directory" >&2
        exit 2
      fi
      PROJECT_DIR="$2"
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "install.sh: unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
  shift
done

if [ -z "$TARGET" ]; then
  usage >&2
  exit 2
fi

if [ -n "$PROJECT_DIR" ] && [ ! -d "$PROJECT_DIR" ]; then
  echo "install.sh: project directory does not exist: $PROJECT_DIR" >&2
  exit 2
fi

# The repo's own .claude/skills is the source; installing over it would delete it.
if [ -n "$PROJECT_DIR" ] && [ "$(cd "$PROJECT_DIR" && pwd)" = "$SRC" ]; then
  echo "install.sh: --project cannot be this repository (it holds the source skills)" >&2
  exit 2
fi

# Base directory for a harness: the project when --project is given, else home.
base_dir() {
  if [ -n "$PROJECT_DIR" ]; then
    echo "$PROJECT_DIR"
  else
    echo "$HOME"
  fi
}

# Replace <skills_dir>/<persona> with a fresh copy of that persona plus the
# shared docs.
install_skill() {
  local label="$1"
  local skills_dir="$2"
  local skill_name="$3"
  local dest="$skills_dir/$skill_name"

  if [ "$DRY_RUN" -eq 1 ]; then
    echo "[dry-run] $label: replace $dest with $skill_name/SKILL.md and skill/"
    return
  fi

  # Stage next to the destination, then swap, so a failed copy never leaves
  # a half-installed skill behind.
  mkdir -p "$skills_dir"
  local staging
  staging="$(mktemp -d "$skills_dir/.$skill_name.XXXXXX")"
  cp -R "$SKILLS_SRC/$skill_name/." "$staging/"
  cp -R "$SHARED_DOCS" "$staging/skill"
  rm -rf "$dest"
  mv "$staging" "$dest"
  echo "installed $label -> $dest"
}

install_all_skills() {
  local label="$1"
  local skills_dir="$2"
  local skill_dir
  for skill_dir in "$SKILLS_SRC"/*/; do
    install_skill "$label" "$skills_dir" "$(basename "$skill_dir")"
  done
}

install_agents() { install_all_skills "agents" "$(base_dir)/.agents/skills"; }
install_claude() { install_all_skills "claude" "$(base_dir)/.claude/skills"; }
install_hermes() {
  if [ -n "$PROJECT_DIR" ]; then
    echo "skipped hermes: it has no project-scoped skills folder"
    return
  fi
  install_all_skills "hermes" "$HOME/.hermes/skills"
}

case "$TARGET" in
  agents) install_agents ;;
  claude) install_claude ;;
  hermes) install_hermes ;;
  all)
    install_agents
    install_claude
    install_hermes
    ;;
esac
