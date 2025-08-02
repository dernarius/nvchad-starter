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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    map("n", "<Leader>p", function()
      vim.api.nvim_echo({ { "hello python!" } }, true, {})
    end, { buffer = true })
  end,
})
