-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- system clipboard - normal + visual
-- vim.keymap.set("n", "<leader>y", '"+y')
-- vim.keymap.set("v", "<leader>y", '"+y')
-- vim.keymap.set("n", "<leader>p", '"+p')
-- vim.keymap.set("v", "<leader>p", '"+p')
-- vim.keymap.set("n", "<leader>P", '"+P')
-- vim.keymap.set("v", "<leader>P", '"+P')

-- formatting
vim.keymap.set({ "n", "v" }, "<leader>p", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- vertical motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- neo tree shortcuts
vim.keymap.set({ "n", "v" }, "<C-e>", function()
  require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
end)

-- editor
-- vim.keymap.set("n", "<A-z>", "<leader>uw")
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- suggestions
vim.keymap.set("n", "gh", function()
  vim.lsp.buf.hover()
end, { desc = "Hover" })

-- open the current file's folder in finder
vim.keymap.set("n", "<leader>o", ":silent !open %:p:h<CR>", { silent = true })

-- copy relative path
vim.keymap.set('n', '<leader>cp', function()
  local path = vim.fn.expand('%:.')
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end, { desc = 'Copy relative path' })

