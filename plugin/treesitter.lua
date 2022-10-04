-- plugin/nvim-treesitter
-- plugin/nvim-treesitter-refactor

require 'nvim-treesitter.configs'.setup {
    ensure_installed = {},
    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
        disable = {},
    },

    refactor = {
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = '<leader>rn',
            }
        },

        navigation = {
            enable = true,
            keymaps = {
                goto_definition = 'gnd',
                list_definitions = 'gnD',
                list_definitions_toc = 'gO',
                goto_next_usage = '<A-]>',
                goto_previous_usage = '<A-[>',
            }
        }
    }
}
