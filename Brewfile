# Brewfile: install jcode + ScrollWM together, always at the latest version.
#
#   jcode    - AI coding agent (CLI formula)
#   scrollwm - PaperWM-style scrolling window manager for macOS (GUI cask)
#
# These two are maintained by the same author and pair well together. This
# Brewfile pins NO versions, so `brew bundle` always installs/upgrades to the
# newest release of each. Each project's own release CI keeps its tap in sync,
# so this file never needs to change when either tool ships a new version.
#
# Usage:
#   brew bundle --file=Brewfile            # install both (latest)
#   brew bundle --file=Brewfile --upgrade  # force upgrade both to latest
#
# Or, in one line from anywhere:
#   curl -fsSL https://raw.githubusercontent.com/1jehuang/homebrew-jcode/main/Brewfile | brew bundle --file=-

tap "1jehuang/jcode"
tap "1jehuang/scrollwm", "https://github.com/1jehuang/scrollwm"

brew "jcode"
cask "scrollwm"
