#!/bin/bash
#
# dotfiles setup script
#
# References:
#   Homebrew: https://brew.sh/
#   nvm: https://github.com/nvm-sh/nvm
#   Zenn CLI: https://zenn.dev/zenn/articles/install-zenn-cli
#   Go: https://formulae.brew.sh/formula/go
#   Claude Code: https://formulae.brew.sh/cask/claude-code
#   Codex: https://formulae.brew.sh/cask/codex
#   Gemini CLI: https://formulae.brew.sh/formula/gemini-cli
#   Cursor CLI: https://formulae.brew.sh/cask/cursor-cli
#

set -e

echo "=== dotfiles setup ==="

# Homebrew
# https://brew.sh/
echo ""
echo "--- Installing Homebrew ---"
if command -v brew &> /dev/null; then
    echo "Homebrew is already installed"
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# nvm (node.js version manager)
# https://github.com/nvm-sh/nvm
echo ""
echo "--- Installing nvm ---"
if [ -d "$HOME/.nvm" ]; then
    echo "nvm is already installed"
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi

# Load nvm for this session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install latest stable Node.js if nvm is available
if command -v nvm &> /dev/null; then
    echo ""
    echo "--- Installing Node.js (stable) via nvm ---"
    nvm install node
fi

# Zenn CLI
# https://zenn.dev/zenn/articles/install-zenn-cli
echo ""
echo "--- Installing Zenn CLI ---"
if command -v npm &> /dev/null; then
    npm install -g zenn-cli
    echo "Zenn CLI installed"
else
    echo "npm not available. Please install Node.js first."
fi

# Go
# https://formulae.brew.sh/formula/go
echo ""
echo "--- Installing Go ---"
if command -v brew &> /dev/null; then
    brew install go
    echo "Go installed"
else
    echo "Homebrew not available. Please install Homebrew first."
fi

# Claude Code
# https://formulae.brew.sh/cask/claude-code
echo ""
echo "--- Installing Claude Code ---"
if command -v brew &> /dev/null; then
    brew install --cask claude-code
else
    echo "Homebrew not available. Please install Homebrew first."
fi

# Codex (OpenAI)
# https://formulae.brew.sh/cask/codex
echo ""
echo "--- Installing Codex ---"
if command -v brew &> /dev/null; then
    brew install --cask codex
else
    echo "Homebrew not available. Please install Homebrew first."
fi

# Gemini CLI
# https://formulae.brew.sh/formula/gemini-cli
echo ""
echo "--- Installing Gemini CLI ---"
if command -v brew &> /dev/null; then
    brew install gemini-cli
else
    echo "Homebrew not available. Please install Homebrew first."
fi

# Cursor CLI
# https://formulae.brew.sh/cask/cursor-cli
echo ""
echo "--- Installing Cursor CLI ---"
if command -v brew &> /dev/null; then
    brew install --cask cursor-cli
else
    echo "Homebrew not available. Please install Homebrew first."
fi

echo ""
echo "=== Setup complete ==="
