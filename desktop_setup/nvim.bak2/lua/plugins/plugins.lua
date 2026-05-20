-- return {
--   {
--     "folke/zen-mode.nvim",
--     config = function()
--       require("zen-mode").setup {
--         -- your configuration comes here
--         -- or leave it empty to use the default settings
--         -- refer to the configuration section below
--       }
--     end
--   },
--   {
--     "folke/noice.nvim",
--     config = function()
--       require("noice").setup({
--         lsp = {
--           -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--           override = {
--             ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--             ["vim.lsp.util.stylize_markdown"] = true,
--             ["cmp.entry.get_documentation"] = true,
--           },
--         },
--         -- you can enable a preset for easier configuration
--         presets = {
--           bottom_search = true,         -- use a classic bottom cmdline for search
--           command_palette = true,       -- position the cmdline and popupmenu together
--           long_message_to_split = true, -- long messages will be sent to a split
--           inc_rename = false,           -- enables an input dialog for inc-rename.nvim
--           lsp_doc_border = false,       -- add a border to hover docs and signature help
--         },
--       })
--     end,
--     dependencies = {
--       -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--       "MunifTanjim/nui.nvim",
--       -- OPTIONAL:
--       --   `nvim-notify` is only needed, if you want to use the notification view.
--       --   If not available, we use `mini` as the fallback
--       "rcarriga/nvim-notify",
--     }
--   },
local function gh(repo) return 'https://github.com/' .. repo end
-- Useful plugins
vim.pack.add {
	-- Toggleterm which is spawning a terminal in nvim
	{ src = gh('akinsho/toggleterm.nvim') },
	-- Git related plugins
	{ src = gh('tpope/vim-fugitive') },
	{ src = gh('tpope/vim-rhubarb') },
	-- theming and colorschemes
	{ src = gh('xiyaowong/transparent.nvim') },
	{ src = gh('stevearc/dressing.nvim') },
	{ src = gh('navarasu/onedark.nvim') },
	{ src = gh('Mofiqul/dracula.nvim') },
	{ src = gh('catppuccin/nvim') },
	{ src = gh('water-sucks/darkrose.nvim') },
	{ src = gh('rmehri01/onenord.nvim') },
	-- Other useful plugins
	{ src = gh('jose-elias-alvarez/null-ls.nvim') },
	{ src = gh('tpope/vim-sleuth') },
	{ src = gh('mbbill/undotree') },
	{ src = gh('nvim-orgmode/orgmode') },

}

-- Toggleterm setup

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup {
	size = 20,
	open_mapping = [[<m-0>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
}

-- Transparent setup

require("transparent").setup({
	groups = { -- table: default groups
		'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
		'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
		'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
		'SignColumn', 'CursorLineNr', 'EndOfBuffer',
	},
	extra_groups = { -- table/string: additional groups that should be cleared
		-- In particular, when you set it to 'all', that means all available groups

		-- example of akinsho/nvim-bufferline.lua
		"BufferLineTabClose",
		"BufferlineBufferSelected",
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineSeparator",
		"BufferLineIndicatorSelected",
	},
	exclude_groups = {}, -- table: groups you don't want to clear
})
