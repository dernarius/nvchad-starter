require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<Leader>t", function()
  vim.cmd "tabnew"
  vim.cmd "term"
end, { desc = "Open terminal" })

map({ "n", "i", "v" }, "<C-s>", function()
  vim.cmd "w"
end, { desc = "Save" })

map("n", "<leader>tt", function()
  require("base46").toggle_theme()
end, { desc = "Toggle theme" })

map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "Code actions" })
