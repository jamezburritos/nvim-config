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
	{ 'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		dependencies = {
			'nvim-lua/plenary.nvim'
		}
	},

    { 'kyazdani42/nvim-tree.lua',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        config = true
    },

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
			lsp.setup()
		end
	},

    { 'folke/which-key.nvim',
        init = function()
            vim.g.mapleader = ' '
        end,
        config = true
    },

    { 'nvim-lualine/lualine.nvim',
        config = {
            options = {
                component_separators = { left = ' ', right = ' ' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = { 'alpha', winbar = { 'NvimTree' } },
                fmt = string.lower
            },

            winbar = {
                lualine_c = { 'filename' }
            },

            inactive_winbar = {
                lualine_c = { 'filename' }
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

    { 'goolord/alpha-nvim',
        config = function()
            local function button(val, shortcut)
                return {
                    type = 'button',
                    val = val,
                    on_press = function() return nil end,
                    opts = {
                        position = 'center',
                        hl = 'Directory',
                        width = 35,
                        shortcut = shortcut,
                        align_shortcut = 'right'
                    }
                }
            end

            require 'alpha'.setup {
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
                    },
                    { type = 'padding', val = 2 },
                    {
                        type = 'group',
                        val = {
                            button(' Search Files', 'C-f'),
                            button(' Search History', 'SPC fo'),
                            button(' Search Help', 'SPC fh'),
                        }
                    }
                }
            }
        end
    },

    { 'rose-pine/neovim',
	    name = 'rose-pine',
	    enabled = true,
	    init = function()
		    vim.cmd.colorscheme('rose-pine')
	    end
	},

    'ThePrimeagen/harpoon' ,
    'nvim-treesitter/nvim-treesitter' ,
    'mbbill/undotree',
    'tpope/vim-fugitive'
}
