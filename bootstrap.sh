#!/bin/bash
set -euo pipefail

# Configuration
GITHUB_USER="${1:-namtoki}"
DOTFILES_REPO="https://github.com/${GITHUB_USER}/dotfiles.git"
DOTFILES_DIR="$HOME/ghq/github.com/${GITHUB_USER}/dotfiles"

# Colors
info() { echo -e "\033[34m[INFO]\033[0m $1"; }
success() { echo -e "\033[32m[OK]\033[0m $1"; }
error() { echo -e "\033[31m[ERROR]\033[0m $1"; exit 1; }

echo ""
echo "================================================"
echo "  Dotfiles Bootstrap Script"
echo "================================================"
echo ""
info "Target repository: $DOTFILES_REPO"
info "Install location: $DOTFILES_DIR"
echo ""

# ============================================
# 1. Xcode Command Line Tools (macOS)
# ============================================
if [[ "$(uname)" == "Darwin" ]]; then
    if ! xcode-select -p &>/dev/null; then
        info "Installing Xcode Command Line Tools..."
        xcode-select --install
        echo "Please wait for Xcode Command Line Tools installation to complete, then run this script again."
        exit 0
    else
        success "Xcode Command Line Tools already installed"
    fi
fi

# ============================================
# 2. Install Devbox
# ============================================
if ! command -v devbox &>/dev/null; then
    info "Installing Devbox..."
    curl -fsSL https://get.jetify.com/devbox | bash
    success "Devbox installed"
else
    success "Devbox already installed ($(devbox version))"
fi

# ============================================
# 3. Clone dotfiles repository
# ============================================
if [[ ! -d "$DOTFILES_DIR" ]]; then
    info "Cloning dotfiles repository..."
    mkdir -p "$(dirname "$DOTFILES_DIR")"
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    success "Dotfiles cloned to $DOTFILES_DIR"
else
    info "Dotfiles directory already exists, pulling latest..."
    git -C "$DOTFILES_DIR" pull
    success "Dotfiles updated"
fi

# ============================================
# 4. Run install script (create symlinks)
# ============================================
info "Running install script..."
bash "$DOTFILES_DIR/install.sh"

# ============================================
# 5. Install Devbox Global packages
# ============================================
info "Installing Devbox global packages..."
devbox global install
success "Devbox global packages installed"

# ============================================
# 6. Install tmux plugin manager (TPM)
# ============================================
TPM_DIR="$HOME/.config/tmux/plugins/tpm"
if [[ ! -d "$TPM_DIR" ]]; then
    info "Installing tmux plugin manager (TPM)..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    success "TPM installed"
else
    success "TPM already installed"
fi

# ============================================
# Done
# ============================================
echo ""
echo "================================================"
success "Bootstrap Complete!"
echo "================================================"
echo ""
info "Next steps:"
echo "  1. Restart your terminal or run: exec \$SHELL -l"
echo "  2. Copy ~/.zshrc.local.example to ~/.zshrc.local and add your secrets:"
echo "     cp $DOTFILES_DIR/shell/.zshrc.local.example ~/.zshrc.local"
echo "  3. Start tmux and press 'prefix + I' to install tmux plugins"
echo "  4. Open Neovim to let LazyVim install plugins automatically"
echo ""
info "Your dotfiles are located at: $DOTFILES_DIR"
echo ""
