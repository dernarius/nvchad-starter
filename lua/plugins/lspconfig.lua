return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvlsp = require("nvchad.configs.lspconfig")

      local lspconfig = require('lspconfig')

      nvlsp.defaults()

      local simples = { "rust_analyzer", "texlab", "rnix" }

      for _, lsp in ipairs(simples) do
        lspconfig[lsp].setup {
          on_attach = nvlsp.on_attach,
          on_init = nvlsp.on_init,
          capabilities = nvlsp.capabilities,
        }
      end

      lspconfig.pylsp.setup {
        on_attach = nvlsp.on_attach,
        capabilities = nvlsp.capabilities,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = {'W391'},
                maxLineLength = 100
              }
            }
          },
        }
      }
    end,
  },
}
