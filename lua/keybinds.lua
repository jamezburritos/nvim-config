-- config/keybinds
-- 
-- KEYBINDINGS
--

local map = function (mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts or {
        noremap = true,
        silent = true
    })
end

local cmd   = require 'hydra.keymap-util'.cmd

-- exit insert mode
map('i', 'jk', '<esc>')
map('i', 'kj', '<esc>')

-- swap :/;
map('', ';', ':')
map('', ':', ';')

-- nvim-tree
map('', '\\', cmd 'NvimTreeToggle')

-- diagnostics
map('n', '<leader>e', function() vim.diagnostic.open_float() end)

-- lsp 
map('n', '<leader>a', function() vim.lsp.buf.code_action() end)
map('n', '<leader>h', function() vim.lsp.buf.hover() end)
map('n', '<leader>r', function() vim.lsp.buf.rename() end)
map('n', 'gd',        function() vim.lsp.buf.definition() end)

-- unmap arrow keys
for _, key in ipairs { 'left', 'right', 'up', 'down' } do
    map({ '', 'i' }, '<' .. key .. '>', '<nop>')
    map({ '', 'i' }, '<C-' .. key .. '>', '<nop>')
end

-- ctrl-hjkl motions
for _, key in ipairs { 'h', 'j', 'k', 'l' } do
    map('i', '<C-' .. key .. '>', cmd ('norm ' .. key))
    map('',  '<C-' .. key .. '>', '<C-w>' .. key)
end

-- 
-- HYDRAS 
-- 

-- TODO: hints for the remaining menus

local hydra = require 'hydra'
local hydra_defaults = {
    invoke_on_body = true,
    color = 'blue',
    hint = {
        border = 'solid'
    }
}

-- new windows
local buffer_hint =
[[ _f_: new file  _s_: split down   _q_: close  
 _t_: new tab   _v_: split right  _w_: write ]]

hydra {
    name = 'window',
    hint = buffer_hint,
    mode = 'n',
    body = '<leader>w',
    config = hydra_defaults,

    heads = {
        { 'f', cmd 'enew' },
        { 's', cmd 'new' },
        { 't', cmd 'tabnew' },
        { 'v', cmd 'vnew' },
        { 'q', cmd 'wq' },
        { 'w', cmd 'w' },
    }
}

-- options
hydra {
    name = 'options',
    mode = 'n',
    body = '<leader>o',
    config = hydra_defaults,

    heads = {
        { 'w', cmd 'set wrap!' },
        { 'h', cmd 'set hlsearch!' },
        { 'n', cmd 'set rnu!' }
    }
}

-- telescope
hydra {
    name = 'search',
    mode = '',
    body = '<leader>f',
    config = hydra_defaults,

    heads = {
        { 'b', cmd 'Telescope buffers' },
        { 'c', cmd 'Telescope current_buffer_fuzzy_find' },
        { 'd', cmd 'Telescope diagnostics' },
        { 'f', cmd 'Telescope find_files' },
        { 'g', cmd 'Telescope live_grep' },
        { 'h', cmd 'Telescope help_tags' },
        { 'r', cmd 'Telescope oldfiles' },
        { 's', cmd 'Telescope lsp_document_symbols' }
    }
}

-- dap 
local dap = require 'dap'
local dapui = require 'dapui'
hydra {
    name = 'debugger',
    mode = '',
    body = '<leader>d',
    config = hydra_defaults,

    heads = {
        { 'c', function() dap.continue() end },
        { 'r', function() dap.run_to_cursor() end },
        { 'i', function() dap.step_into() end },
        { 'O', function() dap.step_out() end },
        { 'o', function() dap.step_over() end },
        { 'b', function() dap.toggle_breakpoint() end },
        { 'R', function() dap.repl.toggle() end },
        { 's', function() dapui.open() end },
        { 't', function() dap.terminate() dapui.close() end },
    },
}
