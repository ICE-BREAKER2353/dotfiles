-- [[ Setting options ]]
-- See `:help vim.o`

vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.cmdheight = 1
vim.opt.scrolloff = 8
-- vim.cmd [[colorscheme dracula]]
-- vim.cmd [[colorscheme onedark]]

-- vim.cmd[[colorscheme catppuccin-mocha]]
-- vim.cmd [[colorscheme koehler]]

vim.cmd [[colorscheme darkrose]]
-- Lua
-- vim.cmd [[set nowrap]]
-- vim.cmd [[colorscheme tokyonight-night]]
-- vim.cmd [[highlight Normal guibg=none]]
-- vim.cmd [[highlight NonText guibg=none]]
-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

vim.opt.relativenumber = true

vim.opt.cursorline = false
-- Disable swap file creation
vim.o.swapfile = false

-- Enable break indent
vim.o.breakindent = true

--[[ vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" ]]

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.opt.colorcolumn = "80"


-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
