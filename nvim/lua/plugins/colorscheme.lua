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

      local function apply_overrides()
        -- Brighter relative line numbers
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#9a9a9a" })
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#9a9a9a" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#9a9a9a" })
        -- Yellow current line number for contrast
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#e5c07b", bold = true })
        -- Brighter comments
        vim.api.nvim_set_hl(0, "Comment", { fg = "#8a8a8a", italic = true })
        vim.api.nvim_set_hl(0, "SpecialComment", { fg = "#8a8a8a", italic = true })
        vim.api.nvim_set_hl(0, "@comment", { fg = "#8a8a8a", italic = true })
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "bearded",
        callback = apply_overrides,
      })

      apply_overrides()
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

