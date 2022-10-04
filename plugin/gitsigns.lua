-- plugin/gitsigns.nvim
require 'gitsigns'.setup {
    signcolumn = false,
    numhl = true
}

for _, hi in ipairs { 'DiffAdd', 'DiffChange', 'DiffDelete' } do
    vim.cmd ('hi ' .. hi .. ' gui=reverse')
end
