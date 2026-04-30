# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Personal dotfiles for Neovim and WezTerm. The repo is symlinked into the user's home (`~/.config/nvim` → `nvim/`, `~/.wezterm.lua` → `.wezterm.lua`), so edits here directly affect the live config — there is no build step.

## Architecture

### Neovim (`nvim/`) — LazyVim-based

- `init.lua` only bootstraps `config.lazy` (LazyVim).
- `lua/config/` holds LazyVim's standard files: `lazy.lua` (plugin loader + LazyVim import), `options.lua`, `keymaps.lua`, `autocmds.lua`. These extend, not replace, LazyVim defaults.
- `lua/plugins/` is where individual plugin specs live. Each file returns a Lazy spec table. To add a plugin, create a new file here; to tweak a LazyVim default plugin, override its spec in a file here (the LazyVim convention).
- `lazy-lock.json` pins plugin versions and is committed — update it intentionally via `:Lazy sync`/`:Lazy update` from inside Neovim.
- `lazyvim.json` tracks LazyVim extras enabled/disabled (e.g. language extras). Edit via `:LazyExtras` rather than by hand when possible.
- `stylua.toml` formats Lua. Run `stylua nvim/` to format.

### WezTerm (`.wezterm.lua`)

Single-file config. Notable customization: Option/Command + arrow keys are remapped for word/line navigation.

## Common workflows

- Edit configs directly — symlinks mean changes are live on next Neovim/WezTerm launch.
- Format Lua: `stylua nvim/`.
- Update plugins: open Neovim, `:Lazy sync`, then commit the resulting `lazy-lock.json` change.
- The `nvim/lua/plugins/example.lua` file is LazyVim's reference of override patterns — keep it as documentation.
