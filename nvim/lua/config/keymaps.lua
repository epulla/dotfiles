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
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, -2, -1, false)
  if lines[1] ~= "" then
    vim.api.nvim_buf_set_lines(buf, -1, -1, false, { "" })
  end
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
vim.keymap.set("n", "<CR>", "o<Esc>", { desc = "New line below" })
vim.keymap.set("n", "<S-CR>", "O<Esc>", { desc = "New line above" })

-- suggestions
vim.keymap.set("n", "gh", function()
  vim.lsp.buf.hover()
end, { desc = "Hover" })

-- open the current file's folder in finder
vim.keymap.set("n", "<leader>o", ":silent !open %:p:h<CR>", { silent = true })

-- copy relative path
vim.keymap.set("n", "<leader>cp", function()
  local path = vim.fn.expand("%:.")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Copy relative path" })

-- buffers
vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
vim.keymap.set("n", "<leader>bL", function()
  vim.cmd("vsplit")
  vim.cmd("wincmd l")
end, { desc = "Split Right and Focus" })
vim.keymap.set("n", "<leader>bH", function()
  vim.cmd("vsplit")
end, { desc = "Split Right and Focus Left" })
vim.keymap.set("n", "<leader>bJ", function()
  vim.cmd("split")
  vim.cmd("wincmd j")
end, { desc = "Split Below and Focus" })
vim.keymap.set("n", "<leader>bK", function()
  vim.cmd("split")
end, { desc = "Split Below and Focus Above" })

-- git commands
vim.keymap.set("n", "<leader>gj", function()
  require("gitsigns").nav_hunk("next")
end, { desc = "Next Git Change" })
vim.keymap.set("n", "<leader>gk", function()
  require("gitsigns").nav_hunk("prev")
end, { desc = "Previous Git Change" })

-- lazygit
vim.keymap.set("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })

-- terminal mode
vim.keymap.set("n", "<leader>tt", function()
  vim.cmd("terminal")
end, { desc = "New Terminal" })
vim.keymap.set("n", "<leader>tj", function()
  vim.cmd("split | terminal")
end, { desc = "New Terminal splitted horizontally (down)" })
vim.keymap.set("n", "<leader>tl", function()
  vim.cmd("vsplit | terminal")
end, { desc = "New Terminal splitted vertically (left)" })
vim.keymap.set("t", "<M-Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

