return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
      local options = {
        lsp_fallback = true,

        formatters_by_ft = {
          lua = {"stylua"},

          javascript = {"prettier"},
          css = {"prettier"},
          html = {"prettier"},

          python = {"black"},
        }
      }

      require("conform").setup(options)
    end,
  },
}
