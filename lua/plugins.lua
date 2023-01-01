--
-- PLUGINS 
--

-- set mapleader here to ensure correct keybindings
vim.g.mapleader = ' '

-- bootstrap the package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
end

vim.opt.rtp:prepend(lazypath)

-- manage plugins 
require 'lazy'.setup ({
    'goolord/alpha-nvim',	            -- greeter

    { 'windwp/nvim-autopairs',          -- auto pairing
        config = { 
            map_cr = true 
        } 
    },

    { 'numToStr/Comment.nvim',	        -- comments
        config = {
            toggler = {
                line  = '<leader>cc',
                block = '<leader>bc',
            },
            opleader = {
                line  = '<leader>cc',
                block = '<leader>cb',
            },
            mappings = {
                basic    = true,
                extra    = false,
                extended = false
            }
        }
    },

    { 'lewis6991/gitsigns.nvim',        -- git signcolumn
        config = {
            signcolumn = false,
            numhl = true
        }
    },

    { 'm-demare/hlargs.nvim',           -- highlight arguments
        config = true 
    },

    -- TODO: remove this
    'anuvyklack/hydra.nvim',            -- submenus

    { 'nvim-lualine/lualine.nvim',	    -- statusline
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

    { 'xiyaowong/nvim-transparent',     -- transparent background
        config = { 
            enable = true
        }
    },
 
    { 'AmeerTaweel/todo.nvim',            -- comment highlighting
        config = true 
    },

    -- colorschemes
    'tomasr/molokai',
    
    -- completion
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',

    -- debugging
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',

    -- file finder
    { 'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim'
        },
        config = true
    },

    -- file tree
    { 'kyazdani42/nvim-tree.lua',
        dependencies = { 
            'kyazdani42/nvim-web-devicons',
        },
        config = true 
    },

    -- folding
    { 'kevinhwang91/nvim-ufo', 
        dependencies = { 
            'kevinhwang91/promise-async',
        },
        config = true
    },

    -- language support
    'ron-rs/ron.vim',
    'Fymyte/rasi.vim',
    'tikhomirov/vim-glsl',
    'preservim/vim-markdown',

    -- language server
    'neovim/nvim-lspconfig',

    -- snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- treesitter
    'nvim-treesitter/nvim-treesitter',

    -- window autosizing
    { 'anuvyklack/windows.nvim', 
        dependencies = {
            'anuvyklack/animation.nvim',
            'anuvyklack/middleclass',
        },
        config = true
    }
})
