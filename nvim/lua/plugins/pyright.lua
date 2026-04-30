return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        handlers = {
          ["textDocument/publishDiagnostics"] = function() end,
          ["$/progress"] = function() end,
          ["window/showMessage"] = function() end,
          ["window/logMessage"] = function() end,
        },
      },
    },
  },
}

