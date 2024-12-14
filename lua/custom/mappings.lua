local map = vim.keymap.set

map("n", ";", ":", { desc = "Enter command mode" })

map(
  "n", "<leader>tt", 
  function()
    require("base46").toggle_transparency()
  end,
  { desc = "Toggle transparency" }
)
