# dotfiles

Personal config files for Neovim and WezTerm.

## Contents

| Path | Description |
|---|---|
| `nvim/` | Neovim config (LazyVim-based) |
| `.wezterm.lua` | WezTerm terminal config |

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
- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) (required by some Neovim plugins)
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)

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
```

**4. Create symlinks:**

```bash
ln -s ~/Desktop/projects/dotfiles/nvim ~/.config/nvim
ln -s ~/Desktop/projects/dotfiles/.wezterm.lua ~/.wezterm.lua
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

