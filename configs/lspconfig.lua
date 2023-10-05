local lspconfig = require "lspconfig"
local mason_lspconfig = require "mason-lspconfig"

local base = require "plugins.configs.lspconfig"

local config = {
    ensure_installed = {
        -- C/C++
        "clangd",

        -- CSS
        "cssls",
        "tailwindcss",

        -- Golang
        "gopls",

        -- HTML
        "html",

        -- JavaScript
        "eslint",
        "svelte",
        "tsserver",
        "volar", -- vue.js

        -- Python
        "pyright",

        -- Rust
        "rust_analyzer",

        -- Shaders
        "wgsl_analyzer",
    },
}

mason_lspconfig.setup_handlers {
    -- Default
    function(server_name)
        lspconfig[server_name].setup {
            on_attach = base.on_attach,
            capabilities = base.capabilities,
        }
    end,

    -- C/C++
    ["clangd"] = function()
        lspconfig.clangd.setup {
            on_attach = function(client, bufnr)
                client.server_capabilities.signatureHelpProvider = false
                base.on_attach(client, bufnr)
            end,
            capabilities = base.capabilities,
        }
    end,

    -- eslint
    ["eslint"] = function()
        local augroup = vim.api.nvim_create_augroup("EslintFormat", {})

        lspconfig.eslint.setup {
            on_attach = function(client, bufnr)
                vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    command = "EslintFixAll",
                })

                base.on_attach(client, bufnr)
            end,
            capabilities = base.capabilities,
        }
    end,

    -- Lua
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup {
            on_attach = base.on_attach,
            capabilities = base.capabilities,

            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                            [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
                            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
                        },
                        maxPreload = 100000,
                        preloadFileSize = 10000,
                    },
                },
            },
        }
    end,
}

return config
