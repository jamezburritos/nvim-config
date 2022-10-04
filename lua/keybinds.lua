-- config/keybinds
local hydra = require 'hydra'
local cmd   = require 'hydra.keymap-util'.cmd

local hydra_defaults = { invoke_on_body = true, exit = true }
local map_defaults   = { noremap = true }

local map = function (mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts or map_defaults)
end

-- leader key
vim.g.mapleader = ' '

-- miscellaneous
map('', ';', ':')
map('n', '<leader>h', function() vim.lsp.buf.hover() end)

-- exit insert mode
map('i', 'jk', '<esc>')
map('i', 'kj', '<esc>')

-- nvim-tree
map('', '\\', cmd 'NvimTreeToggle')

-- toggleterm
map('', '<leader>t', cmd 'ToggleTerm')
map('t', 'jk', cmd 'ToggleTerm')
map('t', 'kj', cmd 'ToggleTerm')

-- create new buffers
hydra {
    name = 'new',
    mode = 'n',
    body = '<leader>n',
    config = hydra_defaults,

    heads = {
        { 'f', cmd 'enew',   { desc = 'file' }},
        { 't', cmd 'tabnew', { desc = 'tab' }},
        { 's', cmd 'new',    { desc = 'split' }},
        { 'v', cmd 'vnew',   { desc = 'vsplit' }}
    }
}

-- toggle common options
hydra {
    name = 'options',
    mode = 'n',
    body = '<leader>o',
    config = hydra_defaults,

    heads = {
        { 'w', cmd 'set wrap!',     { desc = 'wrap' }},
        { 'h', cmd 'set hlsearch!', { desc = 'hlsearch' }},
        { 'n', cmd 'set rnu!',      { desc = 'relativenumber' }}
    }
}

-- search (telescope)
hydra {
    name = 'search',
    mode = '',
    body = '<leader>f',
    config = hydra_defaults,

    heads = {
        { 'b', cmd 'Telescope buffers',                   { desc = 'buffers' }},
        { 'c', cmd 'Telescope current_buffer_fuzzy_find', { desc = 'contents' }},
        { 'f', cmd 'Telescope find_files',                { desc = 'files' }},
        { 'g', cmd 'Telescope live_grep',                 { desc = 'live grep' }},
        { 'h', cmd 'Telescope help_tags',                 { desc = 'help' }},
        { 'r', cmd 'Telescope oldfiles',                  { desc = 'recent files' }},
        { 's', cmd 'Telescope lsp_document_symbols',      { desc = 'symbols' }}
    }
}

-- unmap arrow keys
for _, key in ipairs { 'left', 'right', 'up', 'down' } do
    map('', '<' .. key .. '>', '<nop>')
    map('', '<C-' .. key .. '>', '<nop>')

    map('i', '<' .. key .. '>', '<nop>')
    map('i', '<C-' .. key .. '>', '<nop>')
end

-- map ctrl-hjkl to single-character motions
for _, key in ipairs { 'h', 'j', 'k', 'l' } do
    map('i', '<C-' .. key .. '>', cmd ('norm ' .. key))
end
