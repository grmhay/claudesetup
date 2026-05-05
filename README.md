# claudesetup

Global Claude Code skills and environment setup.

## Install

```bash
git clone https://github.com/grmhay/claudesetup
cd claudesetup
bash install.sh
```

`install.sh` installs the local skills into `~/.claude/skills/` and installs the community skills via `npx skills add`.

## Full project setup process

Use this when starting a new Python project from scratch.

### 1. Bootstrap the Python project

```bash
git clone https://github.com/grmhay/pythonproject
cd pythonproject
bash create-python-project.sh <your-project-name>
```

Renames the template, updates all references, initialises git.

### 2. Wire up the dev rails

Run from inside your new project directory:

```bash
bash /path/to/setup-dev-rails.sh
```

Adds `pre-commit` to `flake.nix`, creates `.pre-commit-config.yaml`, `prd/`, `plans/`, and appends dev rails rules to `CLAUDE.md`.

### 3. Install global Claude skills

```bash
git clone https://github.com/grmhay/claudesetup
cd claudesetup
bash install.sh
```

### 4. Finish setup in Claude Code

Open Claude Code in the project directory and run:

```
/setup-dev-rails
```

Customises `CLAUDE.md` for the project, verifies `/do-work` is present, and walks through the full checklist.

## Skills

### Local (installed into `~/.claude/skills/`)

| Skill | Description |
|-------|-------------|
| `/setup-dev-rails` | Finish setting up AIHero dev rails in a new Python project |
| `/omarchy` | Customise the Omarchy Linux desktop (Hyprland, Waybar, themes, keybindings) |

### Community (installed via `npx skills add`)

| Skill | Source |
|-------|--------|
| `/write-a-prd` | `aiherohq/skills/write-a-prd` |
| `/write-a-skill` | `aiherohq/skills/write-a-skill` |
| `/prd-to-plan` | `aiherohq/skills/prd-to-plan` |
| `/prd-to-issues` | `aiherohq/skills/prd-to-issues` |
| `/grill-me` | `aiherohq/skills/grill-me` |
