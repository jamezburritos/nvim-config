local plugins = {
    {
        "jose-elias-alvarez/null-ls.nvim",
        lazy = false,
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            -- NOTE: Supported LSP servers should be installed in configs/lspconfig.lua
            ensure_installed = {
                -- C/C++
                "clang-format",

                -- Lua
                "stylua",
            },
        },
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = function()
            return require "custom.configs.lspconfig"
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            renderer = {
                group_empty = true,
            },
        },
    },

    "fedorenchik/fasm.vim",
}

return plugins
