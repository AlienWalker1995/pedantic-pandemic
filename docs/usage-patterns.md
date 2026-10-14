# Usage Patterns

Install first with `./install.sh all` (see the README). In harnesses with slash commands, run a skill as `/pedantic-<role>`. Elsewhere, name it in chat ("use pedantic-pm") or describe the task and let the harness match the skill's description.

## Pattern 1: Full team grilling

**When:** A non-trivial feature or project is about to start.

```
/pedantic-team Let's add notifications.
```

The team runs Product, UX, Frontend, Backend, and DevOps in order, deduplicating questions across phases, until you say stop.

## Pattern 2: One lens

**When:** Only one discipline is in doubt, such as a deploy change or a UI tweak.

```
/pedantic-devops We're moving the worker to a cron schedule.
```

## Pattern 3: Answer and go deeper

Answer with quick picks ("1b, 2a") or your own words ("2: only admins"). Every answer generates new, deeper follow-ups. Skip any question you do not want to answer.

## Pattern 4: Stop and get the assumptions

**When:** The remaining ambiguity is acceptable to you.

```
stop
```

Also accepted: *proceed*, *just build it*, *that's enough*. The skill replaces questions with the assumptions it is forced to make, the still-open items, and any contradictions, so nothing is silently guessed.

## Pattern 5: Structured engineering review

**When:** You want `pedantic-engineer`'s fixed output contract for a substantial task.

```
/pedantic-engineer Review this task and use the full output contract: [task description]
```

The contract has seven parts: problem restatement, ambiguities, questions, provisional assumptions, recommended plan, acceptance criteria, and risks.

## Pattern 6: Team adoption

1. Run `./install.sh all --project <your-repo>` and commit the installed `.agents/skills` and `.claude/skills` folders.
2. To customize a persona, edit its `.claude/skills/<role>/SKILL.md` or the shared docs in `skill/` in this repo.
3. Run `scripts/validate.sh`, then re-run the installer.
