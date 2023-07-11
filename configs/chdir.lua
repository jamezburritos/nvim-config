-- Set up autocmd so that nvim can open directories from cmdline
local augroup = vim.api.nvim_create_augroup("ChDir", {})

vim.api.nvim_clear_autocmds { group = augroup }
vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup,
    pattern = "*",
    callback = function()
        vim.api.nvim_set_current_dir(vim.fn.expand "%:p:h")
        if vim.fn.isdirectory(vim.fn.expand "%:p") then
            vim.cmd "Nvdash"
        end
    end,
})
