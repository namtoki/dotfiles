#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# Colors
info() { echo -e "\033[34m[INFO]\033[0m $1"; }
success() { echo -e "\033[32m[OK]\033[0m $1"; }
warn() { echo -e "\033[33m[WARN]\033[0m $1"; }
error() { echo -e "\033[31m[ERROR]\033[0m $1"; }

# Backup existing file/directory if it exists and is not a symlink
backup_if_exists() {
    local target="$1"
    if [[ -e "$target" && ! -L "$target" ]]; then
        mkdir -p "$BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/"
        warn "Backed up existing $target to $BACKUP_DIR/"
    elif [[ -L "$target" ]]; then
        rm "$target"
        info "Removed existing symlink $target"
    fi
}

# Create symlink
create_symlink() {
    local src="$1"
    local dest="$2"

    backup_if_exists "$dest"

    # Create parent directory if needed
    mkdir -p "$(dirname "$dest")"

    ln -sf "$src" "$dest"
    success "Linked $src -> $dest"
}

info "Starting dotfiles installation..."
info "Dotfiles directory: $DOTFILES_DIR"

# ============================================
# 1. Home directory dotfiles
# ============================================
info "Installing shell configs..."
create_symlink "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"

info "Installing git config..."
create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/git/.gitconfig.github" "$HOME/.gitconfig.github"
create_symlink "$DOTFILES_DIR/git/.gitconfig.gitlab-su" "$HOME/.gitconfig.gitlab-su"

# ============================================
# 2. XDG Config directory (~/.config)
# ============================================
info "Installing XDG config files..."

# Neovim
create_symlink "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"

# tmux
create_symlink "$DOTFILES_DIR/config/tmux" "$HOME/.config/tmux"

# Alacritty
create_symlink "$DOTFILES_DIR/config/alacritty" "$HOME/.config/alacritty"

# Starship
create_symlink "$DOTFILES_DIR/config/starship.toml" "$HOME/.config/starship.toml"

# ============================================
# 3. Claude Code configuration (~/.claude)
# ============================================
info "Installing Claude Code config..."
mkdir -p "$HOME/.claude"
create_symlink "$DOTFILES_DIR/claude/settings.json" "$HOME/.claude/settings.json"
create_symlink "$DOTFILES_DIR/claude/statusline.js" "$HOME/.claude/statusline.js"
chmod +x "$DOTFILES_DIR/claude/statusline.js"

# ============================================
# 4. Devbox Global configuration
# ============================================
info "Syncing Devbox global configuration..."
DEVBOX_GLOBAL_DIR="$HOME/.local/share/devbox/global/default"
mkdir -p "$DEVBOX_GLOBAL_DIR"
create_symlink "$DOTFILES_DIR/devbox.json" "$DEVBOX_GLOBAL_DIR/devbox.json"
create_symlink "$DOTFILES_DIR/devbox.lock" "$DEVBOX_GLOBAL_DIR/devbox.lock"

# ============================================
# Done
# ============================================
echo ""
success "Dotfiles installation complete!"
if [[ -d "$BACKUP_DIR" ]]; then
    info "Backup files are stored in: $BACKUP_DIR"
fi
echo ""
info "Next steps:"
echo "  1. Run 'devbox global install' to install packages"
echo "  2. Restart your shell or run: source ~/.zshrc"
echo "  3. Copy shell/.zshrc.local.example to ~/.zshrc.local and add your secrets"
