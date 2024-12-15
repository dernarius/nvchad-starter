local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        git = { enable = true, ignore = false, timeout = 500, },
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local install = require 'nvim-treesitter.install'
      install["compilers"] = { "zig" }
      install["prefer_git"] = false

      local configs = require("nvim-treesitter.configs")
      configs.setup({
         ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "python",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}

return plugins
