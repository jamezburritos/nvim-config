-- plugin/nvim-treesitter
-- plugin/nvim-treesitter-refactor

require 'nvim-treesitter.configs'.setup {
    ensure_installed = {},
    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
        disable = {},
    }
}
