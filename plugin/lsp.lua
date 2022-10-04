-- plugin/lspconfig
local capabilities = require 'cmp_nvim_lsp'.update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- automatically setup servers with default options
local servers = { 'clangd', 'hls', 'pyright', 'tsserver' }

for _, server in ipairs(servers) do
    require 'lspconfig'[server].setup {
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
        root_dir = function()
            return vim.loop.cwd()
        end
    }
end

-- plugin/nvim-ufo
require 'ufo'.setup {}

-- plugin/lsp_lines.nvim
require 'lsp_lines'.setup {}

-- lsp/lua
require 'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150
    },
    root_dir = function ()
        return vim.loop.cwd()
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
