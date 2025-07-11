return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local nvlsp = require "nvchad.configs.lspconfig"

      nvlsp.defaults()

      local simples = {
        "gopls",
        "nixd",
        "pylsp",
        "rust_analyzer",
        "texlab",
      }

      if vim.loop.os_uname().sysname == "Linux" then
        table.insert(simples, "ruff")
      end

      vim.lsp.config("pylsp", {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                maxLineLength = 88,
              },
              pylint = {
                enabled = true,
              },
            },
          },
        },
      })

      for _, lsp in ipairs(simples) do
        vim.lsp.enable(lsp)
      end
    end,
  },
}
