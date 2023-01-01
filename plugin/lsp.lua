-- plugin/lspconfig
local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

-- change folding capabilities for nvim-ufo
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- diagnostic config
vim.diagnostic.config {
    update_in_insert = true,
    virtual_text = true,
    severity_sort = true
}

-- automatically setup servers with default options
local lsp_defaults = {
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    root_dir = function()
        return vim.loop.cwd()
    end
}

for _, server in ipairs { 'clangd', 'pyright', 'rust_analyzer', 'emmet_ls', 'svelte' } do
    require 'lspconfig'[server].setup(lsp_defaults)
end

-- lsp/lua
require 'lspconfig'['sumneko_lua'].setup {
    unpack(lsp_defaults),
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
