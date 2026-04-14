return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
      })
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    'akinsho/toggleterm.nvim', version = "*", config = true
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
      dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
    config = function ()
      require('user.treesitter')
    end,
  },
  { -- Additional text objects via treesitter
    'nvim-treesitter',
  },
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'mfussenegger/nvim-jdtls',
  'mfussenegger/nvim-dap',
  {
    'mfussenegger/nvim-dap-python',
    ft = "python",

    dependencies = {
      "mfussenegger/nvim-dap",
    },
    -- config = function(_, opts)
    --   local path = "C:/Users/Amin Said/AppData/Local/nvim-data/mason/packages/debugpy/venv/Scripts"
    --   require("dap-python").setup(path)
    -- end,
  },
  'rcarriga/cmp-dap',
  "folke/neodev.nvim",
  'simrat39/rust-tools.nvim',
  'xiyaowong/transparent.nvim',
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  'jose-elias-alvarez/null-ls.nvim',
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      -- dap.listeners.after.event_terminated["dapui_config"] = function()
      --   dapui.close()
      -- end
      -- dap.listeners.after.event_exited["dapui_config"] = function()
      --   dapui.close()
      -- end
    end
  },
  'navarasu/onedark.nvim', -- Theme inspired by Atom
  'folke/tokyonight.nvim',
  'Mofiqul/dracula.nvim',
  'folke/lsp-colors.nvim',
  {
    "catppuccin/nvim", name = "catppuccin"
  },
  'water-sucks/darkrose.nvim',
  'rmehri01/onenord.nvim',
  'nvim-lualine/lualine.nvim', -- Fancier statusline
  'numToStr/Comment.nvim',     -- "gc" to comment visual regions/lines
  'tpope/vim-sleuth',          -- Detect tabstop and shiftwidth automatically
  'mbbill/undotree',
  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },
  {
    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
    main = "ibl",
    opts = {}
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = {
      'mfussenegger/nvim-dap', 'nvim-treesitter/nvim-treesitter'
    }
  },
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1
  },
  {
    'nvim-telescope/telescope-dap.nvim',
    dependencies = { { 'mfussenegger/nvim-dap' },
      { 'rcarriga/nvim-dap-ui' }, { 'Pocco81/DAPInstall.nvim', opt = true } },
    config = [[require('dap.config')]],
    ft = { 'java', 'python', 'rust', 'go' }
  },
  'leoluz/nvim-dap-go',
  {
    'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup {}
    end
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  'onsails/lspkind.nvim',
}
