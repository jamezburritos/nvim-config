-- External Configs
require "custom.configs.chdir"

-- Nvim Options
local opts = {
    cursorline = true,
    expandtab = true,
    hidden = true,
    ignorecase = true,
    incsearch = true,
    showcmd = true,
    smartcase = true,

    backup = false,
    equalalways = false,
    hlsearch = false,
    swapfile = false,
    wrap = false,

    shiftwidth = 4,
    tabstop = 4,
}

for option, value in pairs(opts) do
    vim.o[option] = value
end

-- NVChad Options
---@type ChadrcConfig
local M = {
    plugins = "custom.plugins",

    ui = {
        theme = "catppuccin",
        lsp_semantic_tokens = true,

        nvdash = {
            load_on_startup = true,
        },
    },
}

return M
