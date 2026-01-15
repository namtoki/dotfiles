# ============================================
# Devbox Global
# ============================================
eval "$(devbox global shellenv --init-hook)"

# ============================================
# Zsh Autosuggestions
# ============================================
source "$DEVBOX_PACKAGES_DIR/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# ============================================
# Starship Prompt
# ============================================
eval "$(starship init zsh)"

# ============================================
# Zsh Completion
# ============================================
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit
compinit

# ============================================
# Key Bindings
# ============================================
bindkey '^P' up-line-or-history      # Ctrl-p で履歴を遡る
bindkey '^N' down-line-or-history    # Ctrl-n で履歴を進む

# ============================================
# Zoxide (smart cd)
# ============================================
eval "$(zoxide init zsh)"

# ============================================
# fzf
# ============================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ============================================
# Aliases
# ============================================
# eza (modern ls)
alias ls='eza --icons'
alias ll='eza -la --icons'
alias la='eza -a --icons'
alias tree='eza --tree --icons'

# bat (modern cat)
alias cat='bat'

# lazygit
alias lg='lazygit'

# ============================================
# Environment Variables
# ============================================
export EDITOR='nvim'
export VISUAL='nvim'

# ghq
export GHQ_ROOT="$HOME/ghq"

# ============================================
# Functions
# ============================================
# ghq + fzf でリポジトリに移動
function ghq-fzf() {
    local repo=$(ghq list | fzf --preview "bat --color=always --style=header,grid $(ghq root)/{}/README.md 2>/dev/null || eza -la --icons $(ghq root)/{}")
    if [[ -n "$repo" ]]; then
        cd "$(ghq root)/$repo"
    fi
}
bindkey -s '^g' 'ghq-fzf\n'

# ============================================
# TMUX Auto Start
# ============================================
if [[ -z "${TMUX}" ]]; then
    if [[ -n "${SSH_CLIENT}" ]]; then
        # SSH 接続時: グループセッションで独立した表示
        if tmux has-session -t main 2>/dev/null; then
            tmux new-session -t main
        else
            tmux new-session -s main
        fi
    else
        # ローカル: 通常の接続
        tmux new-session -A -s main
    fi
fi

# ============================================
# Local Settings (secrets, machine-specific)
# ============================================
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
