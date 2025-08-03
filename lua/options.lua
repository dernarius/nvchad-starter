require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local map = vim.keymap.set

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.colorcolumn = "88"
  end,
})

function stk_todo_replace_box(nchar)
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd("s/^[󰄱󰡖󰱒]/" .. nchar)
  vim.cmd "noh"
  vim.api.nvim_win_set_cursor(0, pos)
end

local stk_todo_append = vim.api.nvim_replace_termcodes("<Right>a", true, false, true)

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*.todo.md",
  callback = function()
    vim.api.nvim_echo({ { "todo mappings enabled" } }, true, {})
    map("n", "<Leader>n", function()
      local line = vim.api.nvim_win_get_cursor(0)[1]
      vim.api.nvim_buf_set_lines(0, line, line, false, { "󰄱 " })
      vim.api.nvim_win_set_cursor(0, { line + 1, 0 })
      vim.api.nvim_feedkeys(stk_todo_append, "n", false)
    end, { buffer = true })
    map("n", "<Leader>q", function()
      stk_todo_replace_box "󰄱"
    end, { buffer = true })
    map("n", "<Leader>w", function()
      stk_todo_replace_box "󰡖"
    end, { buffer = true })
    map("n", "<Leader>e", function()
      stk_todo_replace_box "󰱒"
    end, { buffer = true })
  end,
})
