require "nvim-tree-plugin"

require('lualine').setup()

vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.mouse = ""

vim.cmd("highlight CursorLine gui=underline cterm=underline")
-- vim.cmd("highlight CursorLine guibg=DarkGrey ctermbg=DarkGrey")
vim.opt.cursorline = true

vim.api.nvim_create_user_command("E", "NvimTreeOpen", {})

-- vim.opt.syntax = true
-- vim.opt.backspace = true
-- set autoindent
-- set ruler
-- set cursorline
-- set showcmd

