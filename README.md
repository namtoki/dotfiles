# dotfiles

Devbox を使用した macOS 開発環境の dotfiles 管理

## Quick Start

新しい Mac で以下のコマンドを実行するだけで環境構築が完了します:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/namtoki/dotfiles/main/bootstrap.sh)"
```

## Manual Setup

```bash
# 1. Devbox をインストール
curl -fsSL https://get.jetify.com/devbox | bash

# 2. dotfiles をクローン
mkdir -p ~/ghq/github.com/namtoki
git clone https://github.com/namtoki/dotfiles.git ~/ghq/github.com/namtoki/dotfiles

# 3. セットアップスクリプトを実行
cd ~/ghq/github.com/namtoki/dotfiles
./install.sh

# 4. Devbox Global パッケージをインストール
devbox global install

# 5. シェルを再起動
exec $SHELL -l
```

## Packages (Devbox Global)

以下のツールが `devbox global` で管理されています:

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

## Secrets Management

機密情報（API キー等）は `~/.zshrc.local` で管理します:

```bash
# テンプレートをコピー
cp ~/ghq/github.com/namtoki/dotfiles/shell/.zshrc.local.example ~/.zshrc.local

# 編集して機密情報を追加
vim ~/.zshrc.local
```

`.zshrc.local` は `.gitignore` に含まれており、Git にはコミットされません。

## Customization

### パッケージの追加

```bash
# Devbox でパッケージを追加
devbox global add <package>

# devbox.json を更新してコミット
cd ~/ghq/github.com/namtoki/dotfiles
git add devbox.json
git commit -m "Add package: <package>"
git push
```

### 設定の更新

dotfiles 内のファイルを編集するとシンボリックリンク経由で即座に反映されます。

```bash
# 例: Neovim の設定を編集
nvim ~/ghq/github.com/namtoki/dotfiles/config/nvim/lua/config/options.lua

# 変更をコミット
cd ~/ghq/github.com/namtoki/dotfiles
git add -A && git commit -m "Update nvim config"
git push
```

## Sync Across Machines

```bash
# 他のマシンで更新した設定を取り込む
cd ~/ghq/github.com/namtoki/dotfiles
git pull

# Devbox パッケージを再同期
devbox global install
```

## Troubleshooting

### Devbox コマンドが見つからない

```bash
# シェルを再起動
exec $SHELL -l

# または手動で読み込み
eval "$(devbox global shellenv --init-hook)"
```

### tmux プラグインがインストールされない

tmux を起動後、`prefix + I` を押してプラグインをインストール。

### Neovim プラグインエラー

Neovim を起動すると LazyVim が自動的にプラグインをインストールします。
エラーが出る場合は `:Lazy sync` を実行。

## Requirements

- macOS (Intel / Apple Silicon)
- Internet connection
- Git (included in Xcode Command Line Tools)

## License

MIT
