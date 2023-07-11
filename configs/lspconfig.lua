local lspconfig = require "lspconfig"

local base = require "plugins.configs.lspconfig"

lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        base.on_attach(client, bufnr)
    end,
    capabilities = base.capabilities,
}
