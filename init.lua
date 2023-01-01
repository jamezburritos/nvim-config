--
-- nvim - modal text editor
--

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

-- colors
vim.g.transparent_enabled = true
vim.cmd 'colorscheme pywal'
vim.cmd 'hi StatusLineNC guifg=NONE'

-- modules
require 'plugins'
require 'keybinds'

