#!/usr/bin/env bash
# Installs global Claude skills from this repo into ~/.claude/skills/.
# Run from the repo root: bash install.sh

set -euo pipefail

BOLD=$(tput bold 2>/dev/null || echo "")
RESET=$(tput sgr0 2>/dev/null || echo "")
GREEN=$(tput setaf 2 2>/dev/null || echo "")
YELLOW=$(tput setaf 3 2>/dev/null || echo "")

info() { echo "${BOLD}${GREEN}==>${RESET} $*"; }
warn() { echo "${BOLD}${YELLOW}WARN:${RESET} $*"; }

SKILLS_SRC="$(cd "$(dirname "$0")/skills" && pwd)"
SKILLS_DST="${HOME}/.claude/skills"

mkdir -p "$SKILLS_DST"

for skill_dir in "$SKILLS_SRC"/*/; do
  skill_name="$(basename "$skill_dir")"
  dest="$SKILLS_DST/$skill_name"

  if [[ -d "$dest" ]]; then
    warn "Skill '$skill_name' already exists at $dest — overwriting."
    rm -rf "$dest"
  fi

  cp -r "$skill_dir" "$dest"
  info "Installed skill: $skill_name"
done

echo ""
echo "${BOLD}Claude skills installed.${RESET}"
echo "Skills location: $SKILLS_DST"
echo ""
echo "Available skills:"
for skill_dir in "$SKILLS_SRC"/*/; do
  echo "  /$(basename "$skill_dir")"
done
echo ""
echo "Note: community skills (write-a-prd, write-a-skill, prd-to-plan, prd-to-issues, grill-me)"
echo "are installed per-project by running /setup-dev-rails in Claude Code."
