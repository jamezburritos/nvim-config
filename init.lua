--
-- nvim - modal text editor
--

local o   = vim.opt
local g   = vim.g
local cmd = vim.cmd

-- modules
require 'keybinds'
require 'autos'

-- plugins
require 'paq' {
    -- package manager
    'savq/paq-nvim',

    -- miscellaneous
    'akinsho/toggleterm.nvim',      -- terminal integration
    'anuvyklack/hydra.nvim',        -- submenus
    'goolord/alpha-nvim',	        -- greeter
    'lewis6991/gitsigns.nvim',      -- git signcolumn
    'm-demare/hlargs.nvim',         -- highlight arguments
    'norcalli/nvim-colorizer.lua',	-- color highlighting
    'numToStr/Comment.nvim',	    -- comments
    'nvim-lualine/lualine.nvim',	-- statusline
    'windwp/nvim-autopairs',	    -- auto pairing
    'xiyaowong/nvim-transparent',   -- transparent background

    -- colorschemes
    'saihnne/everforest',
    'nekonako/xresources-nvim',

    -- folding
    'kevinhwang91/nvim-ufo',
    'kevinhwang91/promise-async',

    -- file tree
    'kyazdani42/nvim-tree.lua',
    'kyazdani42/nvim-web-devicons',

    -- file finder
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-telescope/telescope.nvim',

    -- lsp
    'neovim/nvim-lspconfig',
    { 'lsp_lines.nvim', url='https://git.sr.ht/~whynothugo/lsp_lines.nvim' },

    -- treesitter
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-refactor',

    -- completion
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',

    -- snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- language support
    'ron-rs/ron.vim',
    'Fymyte/rasi.vim',
    'tikhomirov/vim-glsl'
}

-- options
o.cursorline 	 = true
o.expandtab 	 = true
o.foldenable     = true
o.hidden         = true
o.ignorecase 	 = true
o.incsearch 	 = true
o.number 	     = true
o.relativenumber = true
o.showcmd	     = true
o.smartcase 	 = true
o.splitbelow 	 = true
o.splitright     = true
o.termguicolors  = true

o.backup 	     = false
o.hlsearch 	     = false
o.wrap 	         = false
o.swapfile       = false

o.cmdheight      = 0
o.foldlevel      = 99
o.foldlevelstart = 99
o.history    	 = 1000
o.laststatus 	 = 3
o.mouse      	 = 'a'
o.scrolloff  	 = 5
o.shell          = '/bin/zsh'
o.shiftwidth 	 = 4
o.signcolumn 	 = 'auto:1'
o.tabstop    	 = 4

vim.diagnostic.config {
    update_in_insert = true,
    virtual_text = false,
}

-- colors
g.transparent_enabled = true
cmd 'colorscheme xresources'
