require "nvim-tree-plugin"

require('lualine').setup()

vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.mouse = ""

vim.api.nvim_create_user_command("E", "NvimTreeOpen", {})

-- vim.opt.syntax = true
-- vim.opt.backspace = true
-- set autoindent
-- set ruler
-- set cursorline
-- set showcmd

