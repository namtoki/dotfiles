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
# 1. OS-specific prerequisites
# ============================================
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS: Xcode Command Line Tools
    if ! xcode-select -p &>/dev/null; then
        info "Installing Xcode Command Line Tools..."
        xcode-select --install
        echo "Please wait for Xcode Command Line Tools installation to complete, then run this script again."
        exit 0
    else
        success "Xcode Command Line Tools already installed"
    fi
elif [[ "$(uname)" == "Linux" ]]; then
    # Linux: Install zsh and git via apt
    if command -v apt &>/dev/null; then
        PACKAGES_TO_INSTALL=()
        if ! command -v zsh &>/dev/null; then
            PACKAGES_TO_INSTALL+=("zsh")
        fi
        if ! command -v git &>/dev/null; then
            PACKAGES_TO_INSTALL+=("git")
        fi
        if ! command -v curl &>/dev/null; then
            PACKAGES_TO_INSTALL+=("curl")
        fi
        if ! command -v unzip &>/dev/null; then
            PACKAGES_TO_INSTALL+=("unzip")
        fi
        if ! command -v fc-cache &>/dev/null; then
            PACKAGES_TO_INSTALL+=("fontconfig")
        fi

        if [[ ${#PACKAGES_TO_INSTALL[@]} -gt 0 ]]; then
            info "Installing prerequisites: ${PACKAGES_TO_INSTALL[*]}..."
            sudo apt update
            sudo apt install -y "${PACKAGES_TO_INSTALL[@]}"
            success "Prerequisites installed"
        else
            success "Prerequisites already installed (zsh, git, curl)"
        fi
    else
        error "apt not found. Please install zsh, git, and curl manually."
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
# 3. Set zsh as default shell (Linux only)
# ============================================
if [[ "$(uname)" == "Linux" ]]; then
    if [[ "$SHELL" != *"zsh"* ]]; then
        info "Setting zsh as default shell..."
        chsh -s "$(which zsh)"
        success "Default shell changed to zsh (restart terminal to take effect)"
    else
        success "zsh is already the default shell"
    fi
fi

# ============================================
# 4. Clone dotfiles repository
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
# 5. Run install script (create symlinks)
# ============================================
info "Running install script..."
bash "$DOTFILES_DIR/install.sh"

# ============================================
# 6. Install Devbox Global packages
# ============================================
info "Installing Devbox global packages..."
devbox global install
success "Devbox global packages installed"

# ============================================
# 7. Install tmux plugin manager (TPM)
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
# 8. Install Nerd Fonts (FiraCode)
# ============================================
if [[ "$(uname)" == "Darwin" ]]; then
    if ! brew list --cask font-fira-code-nerd-font &>/dev/null; then
        info "Installing FiraCode Nerd Font..."
        brew install --cask font-fira-code-nerd-font
        success "FiraCode Nerd Font installed"
    else
        success "FiraCode Nerd Font already installed"
    fi
elif [[ "$(uname)" == "Linux" ]]; then
    FONT_DIR="$HOME/.local/share/fonts"
    if [[ ! -f "$FONT_DIR/FiraCodeNerdFont-Regular.ttf" ]]; then
        info "Installing FiraCode Nerd Font..."
        mkdir -p "$FONT_DIR"
        FONT_VERSION="v3.3.0"
        curl -fLo "/tmp/FiraCode.zip" \
            "https://github.com/ryanoasis/nerd-fonts/releases/download/${FONT_VERSION}/FiraCode.zip"
        unzip -o /tmp/FiraCode.zip -d "$FONT_DIR"
        rm /tmp/FiraCode.zip
        fc-cache -fv
        success "FiraCode Nerd Font installed"
    else
        success "FiraCode Nerd Font already installed"
    fi
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
echo "  2. Edit Git config files with your name and email:"
echo "     vim ~/.gitconfig.github"
echo "     vim ~/.gitconfig.gitlab-su  # if applicable"
echo "  3. Copy ~/.zshrc.local.example to ~/.zshrc.local and add your secrets:"
echo "     cp $DOTFILES_DIR/shell/.zshrc.local.example ~/.zshrc.local"
echo "  4. Start tmux and press 'prefix + I' to install tmux plugins"
echo "  5. Open Neovim to let LazyVim install plugins automatically"
echo ""
info "Your dotfiles are located at: $DOTFILES_DIR"
echo ""
