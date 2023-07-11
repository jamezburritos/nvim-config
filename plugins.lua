local plugins = {
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                -- C/C++
                "clangd",
                "clang-format",

                -- Rust
                "rust-analyzer",

                -- Lua
                "stylua",

                -- Golang
                "gopls",

                -- Python
                "pyright",
                "black",

                -- JavaScript
                "eslint-lsp",
                "vue-language-server",
                "svelte-language-server",
            },
        },
    },
}

return plugins
