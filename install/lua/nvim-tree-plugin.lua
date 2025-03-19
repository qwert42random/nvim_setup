local function nvim(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  -- api.config.mappings.default_on_attach(bufnr)
  -- vim.print("Hello there world!!!")
  -- vim.print("Hello world: " + bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open dir'))
end

require('nvim-tree').setup({
    view = {
        width = 30,
    },
    git = {
        enable = true,
    },
    on_attach = nvim,
})

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if (vim.fn.bufname() == "NvimTree_1") then
            vim.cmd("highlight CursorLine guibg=DarkGrey ctermbg=DarkGrey gui=NONE cterm=NONE")
        else
            vim.cmd("highlight CursorLine guibg=NONE ctermbg=NONE gui=underline cterm=underline")
        end
    end,
})

