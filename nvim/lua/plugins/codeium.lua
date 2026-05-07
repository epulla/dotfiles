return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    init = function()
      -- We define <Tab> ourselves so it prefers Codeium, then falls back to
      -- snippet jump / cmp selection / a literal <Tab>.
      vim.g.codeium_no_map_tab = 1
      vim.g.codeium_disable_bindings = 1
    end,
    config = function()
      local has_suggestion = function()
        local ok, res = pcall(vim.fn["codeium#GetStatusString"])
        if not ok then
          return false
        end
        -- GetStatusString returns " ON" / "OFF" / " 0" / " 1/3" etc.
        -- A visible suggestion shows "<idx>/<total>".
        return type(res) == "string" and res:match("%d+/%d+") ~= nil
      end

      -- <Tab>: accept Codeium → snippet jump → cmp confirm/select → literal Tab
      vim.keymap.set("i", "<Tab>", function()
        if has_suggestion() then
          return vim.fn["codeium#Accept"]()
        end
        local luasnip_ok, luasnip = pcall(require, "luasnip")
        if luasnip_ok and luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
          return ""
        end
        local cmp_ok, cmp = pcall(require, "cmp")
        if cmp_ok and cmp.visible() then
          cmp.confirm({ select = true })
          return ""
        end
        return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
      end, { expr = true, silent = true, desc = "Codeium / snippet / cmp / Tab" })

      -- <S-Tab>: snippet jump back, otherwise literal <S-Tab>
      vim.keymap.set("i", "<S-Tab>", function()
        local luasnip_ok, luasnip = pcall(require, "luasnip")
        if luasnip_ok and luasnip.jumpable(-1) then
          luasnip.jump(-1)
          return ""
        end
        return vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true)
      end, { expr = true, silent = true, desc = "Snippet jump back" })

      -- Codeium defaults for the rest
      vim.keymap.set("i", "<M-]>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true, desc = "Codeium: next suggestion" })
      vim.keymap.set("i", "<M-[>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true, desc = "Codeium: previous suggestion" })
      vim.keymap.set("i", "<C-]>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true, desc = "Codeium: clear suggestion" })
    end,
  },
}
