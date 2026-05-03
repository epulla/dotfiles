# dotfiles

Personal config files for Neovim and WezTerm.

## Contents

| Path | Description |
|---|---|
| `nvim/` | Neovim config (LazyVim-based) |
| `.wezterm.lua` | WezTerm terminal config |
| `ghostty/` | Ghostty terminal config |
| `.zshrc` | Zsh config (oh-my-zsh) |
| `zsh/` | Custom oh-my-zsh files (aliases, etc.) |

### Neovim setup

Built on top of [LazyVim](https://lazyvim.org). Key plugins included:

- **bearded-nvim** — colorscheme (vivid-black flavor)
- **blink.cmp** — completion engine
- **copilot.lua** + **blink-copilot** — GitHub Copilot integration
- **nvim-lspconfig** + **mason.nvim** — LSP support
- **neo-tree.nvim** — file explorer
- **gitsigns.nvim** — git indicators
- **noice.nvim** — UI improvements
- **nvim-treesitter** — syntax highlighting
- **flash.nvim** — navigation
- **lualine.nvim** — statusline
- **bufferline.nvim** — buffer tabs
- **trouble.nvim** — diagnostics
- **venv-selector.nvim** — Python venv selector
- **import-cost.nvim** — JavaScript import size display

### WezTerm setup

- Custom key bindings for Option/Command + arrow keys (word navigation)

---

## Installation on a new computer

### Prerequisites

Make sure you have these installed:

- [Neovim](https://neovim.io/) (>= 0.9)
- [WezTerm](https://wezfurlong.org/wezterm/)
- [Ghostty](https://ghostty.org/)
- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) (required by some Neovim plugins)
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)
- [fd](https://github.com/sharkdp/fd) (required by venv-selector.nvim to find Python virtual environments)
- [oh-my-zsh](https://ohmyz.sh/) (for the zsh config)

### Steps

**1. Clone the repo:**

```bash
git clone git@github.com:epulla/dotfiles.git ~/Desktop/projects/dotfiles
```

**2. Backup existing configs (optional but recommended):**

```bash
cp -r ~/.config/nvim ~/.config/nvim.bak
cp ~/.wezterm.lua ~/.wezterm.lua.bak
```

**3. Remove existing configs:**

```bash
rm -rf ~/.config/nvim
rm ~/.wezterm.lua
rm -rf ~/.config/ghostty
rm ~/.zshrc
rm ~/.oh-my-zsh/custom/aliases.zsh
```

**4. Create symlinks:**

```bash
ln -s ~/Desktop/projects/dotfiles/nvim ~/.config/nvim
ln -s ~/Desktop/projects/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -s ~/Desktop/projects/dotfiles/ghostty ~/.config/ghostty
ln -s ~/Desktop/projects/dotfiles/.zshrc ~/.zshrc
ln -s ~/Desktop/projects/dotfiles/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
```

**5. Open Neovim** — LazyVim will automatically install all plugins on first launch:

```bash
nvim
```

---

## Keeping configs up to date

Since the configs are symlinked, any change you make is automatically reflected in the repo. Just commit and push:

```bash
cd ~/Desktop/projects/dotfiles
git add .
git commit -m "update config"
git push
```

And on other computers, just pull:

```bash
cd ~/Desktop/projects/dotfiles
git pull
```

