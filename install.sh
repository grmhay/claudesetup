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

COMMUNITY_SKILLS=(
  "aiherohq/skills/write-a-skill"
  "aiherohq/skills/write-a-prd"
  "aiherohq/skills/prd-to-plan"
  "aiherohq/skills/prd-to-issues"
  "aiherohq/skills/grill-me"
)

echo ""
info "Installing community skills via npx..."

if ! command -v npx &>/dev/null; then
  warn "npx not found — skipping community skills. Install Node.js then re-run this script."
else
  for skill in "${COMMUNITY_SKILLS[@]}"; do
    skill_name="$(basename "$skill")"
    info "Installing: $skill_name"
    npx skills add "$skill" --yes || warn "Failed to install $skill_name — install manually: npx skills add $skill"
  done
fi

echo ""
echo "${BOLD}Claude skills installed.${RESET}"
echo ""
echo "Local skills (${SKILLS_DST}):"
for skill_dir in "$SKILLS_SRC"/*/; do
  echo "  /$(basename "$skill_dir")"
done
echo ""
echo "Community skills:"
for skill in "${COMMUNITY_SKILLS[@]}"; do
  echo "  /$(basename "$skill")"
done
