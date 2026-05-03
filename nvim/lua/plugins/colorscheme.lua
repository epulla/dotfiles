return {
  -- add theme
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "deep",
    },
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- gamma = 0.90,
      custom_palette = {
        -- bg0 = "#07103b",
        -- green = "#FE6D85"
      },
    },
    config = function(_, opts)
      require("tokyodark").setup(opts)
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        -- configurations
      })
    end,
  },
  {
    "Ferouk/bearded-nvim",
    name = "bearded",
    priority = 1000,
    build = function()
      local doc = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "bearded", "doc")
      pcall(vim.cmd, "helptags " .. doc)
    end,
    config = function()
      require("bearded").setup({
        flavor = "vivid-black", -- change to any flavor you want
      })
    end,
  },
  -- Configure LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyodark",
      -- colorscheme = "onedark",
      colorscheme = "bearded",
    },
  },
}

