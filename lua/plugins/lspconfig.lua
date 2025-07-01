return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvlsp = require("nvchad.configs.lspconfig")

      nvlsp.defaults()

      local simples = {
        "pylsp",
        "rnix",
        "rust_analyzer",
        "texlab",
      }

      vim.lsp.config("pylsp", 
        {
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  ignore = {'W391'},
                  maxLineLength = 88
                }
              }
            },
          }
        }
      )

      for _, lsp in ipairs(simples) do
        vim.lsp.enable(lsp)
      end
    end,
  },
}
