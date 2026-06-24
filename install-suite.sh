#!/usr/bin/env bash
# Install (or upgrade) both jcode and ScrollWM to their latest versions.
#
#   curl -fsSL https://raw.githubusercontent.com/1jehuang/homebrew-jcode/main/install-suite.sh | bash
#
# What this does:
#   1. Ensures Homebrew is installed (installs it if missing).
#   2. Taps both projects and installs/upgrades jcode (formula) + scrollwm (cask)
#      to the newest release of each, with no version pinning.
#
# Re-running this script always brings both tools up to date.
set -euo pipefail

info() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m==>\033[0m %s\n' "$*" >&2; }

if [[ "$(uname -s)" != "Darwin" ]]; then
  warn "ScrollWM is macOS-only, so this combined installer targets macOS."
  warn "On Linux you can still install jcode:  brew install 1jehuang/jcode/jcode"
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  info "Homebrew not found; installing it first..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Make brew available in this shell for the rest of the script.
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

info "Installing/upgrading jcode + ScrollWM to the latest version..."
brew bundle --no-lock --upgrade --file=- <<'BREWFILE'
tap "1jehuang/jcode"
tap "1jehuang/scrollwm", "https://github.com/1jehuang/scrollwm"
brew "jcode"
cask "scrollwm"
BREWFILE

info "Done. Both jcode and ScrollWM are installed and up to date."
info "  jcode --version"
info "  open -a ScrollWM"
