-- Set up autocmd so that nvim can open directories from cmdline
local augroup = vim.api.nvim_create_augroup("ChDir", {})

vim.api.nvim_clear_autocmds { group = augroup }
vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup,
    pattern = "*",
    callback = function()
        local path = vim.fn.expand "%:p:h"
        vim.api.nvim_set_current_dir(path)
        if vim.fn.isdirectory(path) then
            vim.cmd "Nvdash"
        end
    end,
})
