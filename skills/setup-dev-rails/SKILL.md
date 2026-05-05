---
name: setup-dev-rails
description: Use this skill to finish setting up the AIHero development rails in a new Python project after running create-python-project.sh and setup-dev-rails.sh
disable-model-invocation: false
---

# Setup Dev Rails

You are helping the user complete the final, interactive steps of setting up the AIHero development rails in their new Python project. The shell script (`setup-dev-rails.sh`) has already handled the mechanical setup. Your job is to handle the steps that require judgement and context.

## Step 1: Confirm the shell script ran successfully

Ask the user: "Has `setup-dev-rails.sh` completed without errors?" If not, help them fix the issue before continuing.

Verify the following files exist:
- `.pre-commit-config.yaml`
- `prd/` directory
- `plans/` directory
- `CLAUDE.md` (check it contains the dev rails section)

## Step 2: Verify global Claude skills are installed

The community skills are managed globally via [claudesetup](https://github.com/grmhay/claudesetup) and should already be present. Check that the following skills are available in `~/.claude/skills/`:

- `write-a-skill`
- `write-a-prd`
- `prd-to-plan`
- `prd-to-issues`
- `grill-me`

If any are missing, tell the user to run:

```bash
git clone https://github.com/grmhay/claudesetup
cd claudesetup
bash install.sh
```

## Step 3: Customise CLAUDE.md for this project

Read the current `CLAUDE.md`. The dev rails section is already present from the script. Now add 1–3 project-specific rules by asking the user:

1. "What is this project for? (one sentence)"
2. "Are there any naming conventions, patterns, or constraints specific to this project that Claude should always follow?"
3. "Is anything explicitly out of scope for this project?"

Add their answers to CLAUDE.md under a `## Project conventions` section above the dev rails rules. Keep it concise — one line per rule.

## Step 4: Verify the /do-work skill

The `/do-work` skill is bundled in the pythonproject template at `.claude/skills/do-work/SKILL.md`. Confirm it exists. If missing, create it with this content:

```markdown
---
name: do-work
description: Use this skill to implement a feature or fix a bug with discipline
---

## Steps

### 1. Understand
Read the task description and any referenced PRD or plan files.

### 2. Plan
If no plan exists, outline the approach in 3-5 bullet points before writing any code.

### 3. Implement
- **Logic / services**: Use red-green-refactor (one failing test → minimum code to pass → refactor → repeat)
- **CLI commands**: Implement directly; test via `click.testing.CliRunner`
- **Type annotations**: Add to every function; run `nox -s mypy` to verify

### 4. Validate
Run `nox`. Iterate until all five sessions pass.

### 5. Commit
Write a meaningful commit message describing the why, not the what.
```

## Step 5: Verify the full setup

Run through this checklist with the user and confirm each item:

- [ ] `nix develop` enters the dev shell without errors
- [ ] `nox` passes all five sessions (taplo, format, check, mypy, pytest)
- [ ] Pre-commit hook fires on a test commit and calls nox
- [ ] `/skills` lists: write-a-skill, write-a-prd, prd-to-plan, prd-to-issues, grill-me, do-work
- [ ] `prd/` and `plans/` directories exist
- [ ] `CLAUDE.md` has both project-specific rules and dev rails rules

## Step 6: Done

Tell the user the project is ready. Remind them of the daily workflow:

```
New feature?   → /write-a-prd → /prd-to-issues
Start an issue → /clear → @prd @plan "Do issue #N"
Write logic?   → red-green-refactor, one test at a time
Validate?      → nox
```
