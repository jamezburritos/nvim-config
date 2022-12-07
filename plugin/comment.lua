-- plugin/nvim-comment

require 'Comment'.setup {
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
