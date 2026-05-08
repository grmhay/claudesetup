# claudesetup

Global Claude Code skills for the AIHero Python dev rails stack.

## Install (once per user account, or once per user account on each machine)

```bash
git clone https://github.com/grmhay/claudesetup
cd claudesetup
bash install.sh
cd .. && rm -rf claudesetup
```

Installs machine-level skills into `~/.claude/skills/`. The clone is not needed after installation.

## Skills installed

| Skill | Description |
|-------|-------------|
| `/setup-dev-rails` | Final interactive setup step for a new Python project in Claude Code |
| `/omarchy` | Customise the Omarchy Linux desktop (Hyprland, Waybar, themes, keybindings) |

## Full project setup process

See [DEV_RAILS.md](https://github.com/grmhay/pythonproject/blob/main/DEV_RAILS.md) in the pythonproject repo for the complete guide.

**Quick summary:**

1. Clone and run `claudesetup/install.sh` (this repo — once per machine)
2. Clone [pythonproject](https://github.com/grmhay/pythonproject) and run `bash create-python-project.sh <name>`
3. `nix develop && nox && pre-commit install`
4. Open Claude Code in the project and run `/setup-dev-rails`
