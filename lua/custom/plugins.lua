local plugins = {
  {
    "NvChad/base46",
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        git = { enable = true, ignore = false, timeout = 500, },
      })
    end
  }
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
  {
    "neovim/nvim-lspconfig",
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },
  {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
      return require "custom.configs.conform"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    commit = 0b751f6beef40fd47375eaf53d3057e0bfa317e4,
    opts = function()
      return require "custom.configs.cmp"
    end,
  },
 }

 return plugins
