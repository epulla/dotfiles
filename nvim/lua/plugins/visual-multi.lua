return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      vim.g.VM_maps = {
        ["Add Cursor Down"] = "<M-S-j>",
        ["Add Cursor Up"] = "<M-S-k>",
        ["Find Under"] = "gb",
      }
    end,
  },
}

