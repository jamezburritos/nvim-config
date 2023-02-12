--
-- PLUGINS
-- Manage plugins and their configurations.
--

-- bootstrap the package manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', lazypath })
    vim.fn.system({ 'git', '-C', lazypath, 'checkout', 'tags/stable' })
end

vim.opt.rtp:prepend(lazypath)

-- plugin setup
require 'lazy'.setup {
	{ 'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Autocompletion
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-path',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/nvim-cmp',

			-- Snippets
			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets',
		},

		init = function()
			local lsp = require 'lsp-zero'
			lsp.preset('recommended')
            lsp.nvim_workspace()
			lsp.setup()

            -- gdscript lsp is not supported by Mason
            require 'lspconfig'.gdscript.setup {}

            -- diagnostic options
            vim.diagnostic.config {
                virtual_text = true,
                update_in_insert = true,
                underline = true,
                severity_sort = true,
            }
		end
	},

    { 'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                sync_install = false,
                auto_install = true,

                ensure_installed = { "c", "lua", "rust" },
                ignore_install = { "javascript" },

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },

    { 'echasnovski/mini.nvim',
        config = function()
            require 'mini.align'.setup()
            require 'mini.comment'.setup()
            require 'mini.cursorword'.setup { delay = 1000 }
            require 'mini.indentscope'.setup()
            require 'mini.pairs'.setup()
            require 'mini.surround'.setup()
        end
    },

    { 'nvim-lualine/lualine.nvim',
        config = {
            options = {
                component_separators = { left = ' ', right = ' ' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = { 'alpha' },
            },

            tabline = {
                lualine_b = { 'windows' }
            },

            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'filesize' },
                lualine_c = { 'branch' },

                lualine_x = { 'location' },
                lualine_y = { 'progress' },
                lualine_z = { 'filetype' }
            }
        }
    },

    { 'goolord/alpha-nvim',
        config =  {
            opts = {
                noautocmd = true,
                setup = function()
                    vim.b.miniindentscope_disable = true
                end
            },
            layout = {
                { type = 'padding', val = 10 },
                {
                    type = 'text',
                    opts = { position = 'center', hl = 'String' },
                    val = {
                        [[                               __                ]],
                        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
                        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
                        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
                        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
                    }
                }
            }
        }
    },

	{ 'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		dependencies = {
			'nvim-lua/plenary.nvim'
		}
	},

    { 'kyazdani42/nvim-tree.lua',
        config = true,
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        }
    },

    { 'folke/noice.nvim',
        config = true,
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify'
        }
    },

    { 'folke/trouble.nvim',
        config = true
    },

    { 'folke/which-key.nvim',
        config = true,
        init = function()
            vim.g.mapleader = ' '
        end
    },

    { 'brenoprata10/nvim-highlight-colors',
        config = {
            render = 'background',
            enable_named_colors = true
        }
    },

    { 'rose-pine/neovim',
	    name = 'rose-pine',
	    init = function()
		    vim.cmd.colorscheme('rose-pine')
	    end
	},

    'mbbill/undotree',
    'tpope/vim-fugitive'
}
