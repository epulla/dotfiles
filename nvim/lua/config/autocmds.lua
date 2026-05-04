-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = vim.api.nvim_create_augroup("autosave", { clear = true }),
  callback = function(args)
    local buf = args.buf
    if vim.bo[buf].buftype ~= "" or not vim.bo[buf].modifiable or not vim.bo[buf].modified then
      return
    end
    if vim.api.nvim_buf_get_name(buf) == "" then
      return
    end
    vim.api.nvim_buf_call(buf, function()
      vim.cmd("silent! write")
    end)
  end,
})
