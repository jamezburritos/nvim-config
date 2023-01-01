--
-- nvim - modal text editor
--

-- modules
require 'keybinds'
require 'autos'

-- plugins
require 'paq' {
    -- package manager
    'savq/paq-nvim',

    -- miscellaneous
    'windwp/nvim-autopairs',	    -- auto pairing
    'norcalli/nvim-colorizer.lua',	-- color highlighting
    'AmeerTaweel/todo.nvim',        -- comment highlighting
    'numToStr/Comment.nvim',	    -- comments
    'airblade/vim-gitgutter',       -- git signcolumn
    'goolord/alpha-nvim',	        -- greeter
    'm-demare/hlargs.nvim',         -- highlight arguments
    'nvim-lualine/lualine.nvim',	-- statusline
    'anuvyklack/hydra.nvim',        -- submenus
    'xiyaowong/nvim-transparent',   -- transparent background

    -- colorschemes
    'fatih/molokai',
    'AlphaTechnolog/pywal.nvim',

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
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-telescope/telescope.nvim',

    -- file tree
    'kyazdani42/nvim-tree.lua',
    'kyazdani42/nvim-web-devicons',

    -- folding
    'kevinhwang91/nvim-ufo',
    'kevinhwang91/promise-async',

    -- language support
    'ron-rs/ron.vim',
    'Fymyte/rasi.vim',
    'tikhomirov/vim-glsl',
    'preservim/vim-markdown',
    'elkowar/yuck.vim',

    -- language server
    'neovim/nvim-lspconfig',

    -- snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- treesitter
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-refactor',
    'windwp/nvim-ts-autotag',

    -- window autosizing
    'anuvyklack/animation.nvim',
    'anuvyklack/middleclass',
    'anuvyklack/windows.nvim',
}

-- options
vim.o.cursorline 	 = true
vim.o.expandtab 	 = true
vim.o.foldenable     = true
vim.o.hidden         = true
vim.o.ignorecase 	 = true
vim.o.incsearch 	 = true
vim.o.number 	     = true
vim.o.relativenumber = true
vim.o.showcmd	     = true
vim.o.smartcase 	 = true
vim.o.splitbelow 	 = true
vim.o.splitright     = true
vim.o.termguicolors  = true

vim.o.backup 	     = false
vim.o.equalalways    = false
vim.o.hlsearch 	     = false
vim.o.wrap 	         = false
vim.o.swapfile       = false

vim.o.cmdheight      = 1
vim.o.foldlevel      = 99
vim.o.foldlevelstart = 99
vim.o.history    	 = 1000
vim.o.laststatus 	 = 3
vim.o.mouse      	 = 'a'
vim.o.scrolloff  	 = 5
vim.o.shell          = '/bin/zsh'
vim.o.shiftwidth 	 = 4
vim.o.signcolumn 	 = 'auto:1'
vim.o.tabstop    	 = 4
vim.o.winwidth       = 10
vim.o.winminwidth    = 10

vim.diagnostic.config {
    update_in_insert = true,
    virtual_text = true,
}

-- plugin setup 
require 'pywal'.setup {}

-- colors
vim.g.transparent_enabled = true
vim.cmd 'colorscheme pywal'
vim.cmd 'hi StatusLineNC guifg=NONE'

