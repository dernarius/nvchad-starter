return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
      local options = {
        lsp_fallback = true,

        formatters_by_ft = {
          lua = { "stylua" },

          javascript = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },

          python = { "black", "isort" },

          go = { "go fmt" },
        },
      }

      require("conform").setup(options)
    end,
  },
}
