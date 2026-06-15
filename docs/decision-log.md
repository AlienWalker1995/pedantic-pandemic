# Decision Log

## Packaging Mechanism Decision

**Decision:** Use CLAUDE.md + skills directory pattern (Option B: project memory / CLAUDE.md pattern).

**Rationale:**
1. Claude Code v2.1.177 auto-discovers `CLAUDE.md` in the project root — no manual loading needed.
2. Skills in `skills/` directory are slash-invocable via `/skill-name`.
3. No external dependencies (no MCP server, no plugin, no npm package).
4. Portable: copy the repo into any project and CLAUDE.md is immediately active.
5. Versionable: the entire skill lives in git, can be updated independently.
6. Supports all Claude Code features: system prompts, custom agents, append-system-prompt.

**Alternatives Considered:**
- **A. First-class skill mechanism:** Claude Code has a `skills/` directory that resolves via `/skill-name`. This is the closest to "first-class" and is what we use for the skill files.
- **C. Slash-command-compatible prompt artifact:** Skills directory serves this purpose.
- **D. MCP prompt/server scaffold:** Overkill for a prompt-based persona. Requires running server.
- **E. Portable repo:** This is what we deliver — a portable repo that uses B as the activation mechanism.

**Final Choice:** B + A combined. CLAUDE.md for auto-discovery, `skill/` directory for the canonical artifacts, `skills/pedantic-engineer/` for slash-invocable skill.

## Assumptions Made

1. GitHub CLI (`gh`) is not installed — remote creation deferred.
2. Claude Code is available via `npx @anthropic-ai/claude-code`.
3. User wants language-agnostic skill (no Python/JS/Go bias).
4. User wants the skill to stop on any ambiguity, not just above a threshold.
5. User wants assumptions logged explicitly, not silently collapsed.
