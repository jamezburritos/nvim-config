-- 
-- KEYMAPS
-- Set keybinds for general use, and import module bindings.
--

vim.g.mapleader = ' '

local which = require 'which-key'
local telescope = require 'telescope.builtin'
local nvim_tree = require 'nvim-tree.api'

which.register { 
    ['<leader>'] = {
        f = {
            name = 'telescope',
            g = { telescope.live_grep, 'live grep' },
            h = { telescope.help_tags, 'help pages' },
            o = { telescope.oldfiles,  'recent files' },
        },

        h = { vim.lsp.buf.hover, 'show hover' },
        e = { vim.diagnostic.open_float, 'open float' },
        r = { vim.lsp.buf.rename, 'rename symbol' }
    },

    ['<C-f>'] = { function()
        if vim.loop.fs_stat('.git') then 
            telescope.git_files() 
        else 
            telescope.find_files() 
        end
    end, 'search files' },

    ['\\'] = { nvim_tree.tree.toggle, 'open file explorer' },

    jk = { '<ESC>', 'exit insert mode', mode = 'i' },
    kj = { '<ESC>', 'exit insert mode', mode = 'i' },

    ['<C-h>'] = { '<left>',  'move cursor left',  mode = 'i' },
    ['<C-j>'] = { '<down>',  'move cursor down',  mode = 'i' },
    ['<C-k>'] = { '<up>',    'move cursor up',    mode = 'i' },
    ['<C-l>'] = { '<right>', 'move cursor right', mode = 'i' },
}
