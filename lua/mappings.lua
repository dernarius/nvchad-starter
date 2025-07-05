require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<Leader>t", function()
  vim.cmd "tabnew"
  vim.cmd "term"
end, { desc = "open terminal" })
map("n", "<Leader>w", function()
  local api = require "nvim-tree.api"
  api.tree.close()
  vim.cmd "bd!"
  api.tree.open()
end, { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "Toggle transparency" })
