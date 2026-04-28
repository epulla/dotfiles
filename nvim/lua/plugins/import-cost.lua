return {
  "barrettruth/import-cost.nvim",
  ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  config = function()
    require("import-cost").setup()
  end,
}

