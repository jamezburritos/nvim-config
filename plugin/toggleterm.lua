-- plugin/toggleterm.nvim
require 'toggleterm'.setup {
    shell = vim.o.shell,
    shade_terminals = false,
    winbar = {
        enabled = false
    }
}
