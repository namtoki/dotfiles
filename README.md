# dotfiles

macOS development environment managed with Devbox

## Prerequisites

This configuration assumes the following tool stack:

- **ghq** - Repository management (`~/ghq/github.com/...` structure)
- **Alacritty** - Terminal emulator
- **tmux** - Terminal multiplexer
- **Neovim** - Text editor (LazyVim based)

## Quick Start

Run the following command on a new Mac to complete the setup:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/namtoki/dotfiles/main/bootstrap.sh)"
```

## Manual Setup

```bash
# 1. Install Devbox
curl -fsSL https://get.jetify.com/devbox | bash

# 2. Clone dotfiles
mkdir -p ~/ghq/github.com/namtoki
git clone https://github.com/namtoki/dotfiles.git ~/ghq/github.com/namtoki/dotfiles

# 3. Run setup script
cd ~/ghq/github.com/namtoki/dotfiles
./install.sh

# 4. Install Devbox Global packages
devbox global install

# 5. Restart shell
exec $SHELL -l
```

## Packages (Devbox Global)

The following tools are managed via `devbox global`:

| Package | Description |
|---------|-------------|
| git | Version control |
| gh | GitHub CLI |
| ghq | Repository manager |
| neovim | Text editor |
| tmux | Terminal multiplexer |
| starship | Cross-shell prompt |
| ripgrep | Fast grep (rg) |
| fd | Fast find |
| fzf | Fuzzy finder |
| eza | Modern ls |
| bat | Modern cat |
| delta | Better git diff |
| jq | JSON processor |
| lazygit | Git TUI |
| zoxide | Smart cd |

## Configuration Files

| Category | Files | Description |
|----------|-------|-------------|
| Shell | `.zshrc` | Zsh configuration |
| Git | `.gitconfig` | Git configuration |
| Editor | `nvim/` | Neovim (LazyVim) |
| Terminal | `tmux/`, `alacritty/` | Terminal settings |
| Prompt | `starship.toml` | Starship prompt |

## Directory Structure

```
dotfiles/
├── bootstrap.sh          # Initial setup script
├── install.sh            # Symlink creation script
├── devbox.json           # Devbox package definition
├── shell/
│   ├── .zshrc
│   └── .zshrc.local.example
├── git/
│   └── .gitconfig
└── config/
    ├── nvim/
    ├── tmux/
    ├── alacritty/
    └── starship.toml
```

## Post-Setup Configuration

### Git User Settings

After setup, edit the Git config files with your actual name and email:

```bash
# GitHub (personal)
vim ~/.gitconfig.github

# GitLab Sound United (work) - if applicable
vim ~/.gitconfig.gitlab-su
```

### Secrets Management

Sensitive information (API keys, etc.) is managed in `~/.zshrc.local`:

```bash
# Copy template
cp ~/ghq/github.com/namtoki/dotfiles/shell/.zshrc.local.example ~/.zshrc.local

# Edit and add secrets
vim ~/.zshrc.local
```

`.zshrc.local` is included in `.gitignore` and will not be committed to Git.

## Customization

### Adding Packages

```bash
# Add package with Devbox
devbox global add <package>

# Update and commit devbox.json
cd ~/ghq/github.com/namtoki/dotfiles
git add devbox.json
git commit -m "Add package: <package>"
git push
```

### Updating Configuration

Changes to files in dotfiles are immediately reflected via symlinks.

```bash
# Example: Edit Neovim config
nvim ~/ghq/github.com/namtoki/dotfiles/config/nvim/lua/config/options.lua

# Commit changes
cd ~/ghq/github.com/namtoki/dotfiles
git add -A && git commit -m "Update nvim config"
git push
```

## Sync Across Machines

```bash
# Pull updates from other machines
cd ~/ghq/github.com/namtoki/dotfiles
git pull

# Re-sync Devbox packages
devbox global install
```

## Troubleshooting

### Devbox command not found

```bash
# Restart shell
exec $SHELL -l

# Or manually load
eval "$(devbox global shellenv --init-hook)"
```

### tmux plugins not installed

After starting tmux, press `prefix + I` to install plugins.

### Neovim plugin errors

LazyVim automatically installs plugins when Neovim starts.
If errors occur, run `:Lazy sync`.

## Requirements

- macOS (Intel / Apple Silicon)
- Internet connection
- Git (included in Xcode Command Line Tools)

## License

MIT
