# homebrew-jcode

Homebrew tap for [jcode](https://github.com/1jehuang/jcode) - an AI coding agent powered by Claude and ChatGPT.

## Install jcode

```bash
brew install 1jehuang/jcode/jcode
```

(or `brew tap 1jehuang/jcode && brew install jcode`)

## Install jcode + ScrollWM together

[ScrollWM](https://github.com/1jehuang/scrollwm) is a PaperWM-style scrolling
window manager for macOS that pairs well with jcode. This installs (and upgrades)
**both** to their latest versions in one step:

```bash
curl -fsSL https://raw.githubusercontent.com/1jehuang/homebrew-jcode/main/install-suite.sh | bash
```

Prefer Homebrew's native bundler? The same thing, no pinning:

```bash
curl -fsSL https://raw.githubusercontent.com/1jehuang/homebrew-jcode/main/Brewfile | brew bundle --file=-
```

Both methods always pull the newest release of each tool - there are no version
pins, and each project's release CI keeps its own formula/cask in sync.

## Update

```bash
brew upgrade jcode             # jcode only
brew upgrade --cask scrollwm   # ScrollWM only

# or re-run the suite installer to update both:
curl -fsSL https://raw.githubusercontent.com/1jehuang/homebrew-jcode/main/install-suite.sh | bash
```
