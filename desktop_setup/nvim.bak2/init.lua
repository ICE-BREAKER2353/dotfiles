vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir) do
  if type == 'file' and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('plugins.' .. module)
  end
end
-- vim.pack.update()
require('user.settings')
-- require('user.telescope')
require('user.keymaps')
require('user.yankHighlight')
-- require('user.gitsigns')
-- require('user.treesitter')
-- require('user.lsp')
-- require('user.cmp')
-- require("user.tokyonight")
-- require("user.toggleterm")
require("user.navic")
require("user.navbuddy")
-- require("user.dressing")
-- require("user.null-ls")
-- require("user.dadbod")
-- require("user.dap-virtual-text")
