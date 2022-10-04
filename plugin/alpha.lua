-- plugin/alpha-nvim
local startify = require 'alpha.themes.startify'

startify.section.header.val = {
[[ ^  ^  ^   ^      ___I_      ^  ^   ^  ^  ^   ^  ^ ]],
[[/|\/|\/|\ /|\    /\-_--\    /|\/|\ /|\/|\/|\ /|\/|\]],
[[/|\/|\/|\ /|\   /  \_-__\   /|\/|\ /|\/|\/|\ /|\/|\]],
[[/|\/|\/|\ /|\   |[]| [] |   /|\/|\ /|\/|\/|\ /|\/|\]],
}

startify.section.top_buttons.val = {
    { type = 'text', val = 'welcome to neovim', opts = { hl = 'SpecialComment' } },
    { type = 'padding', val = 1},

    startify.button('e', 'new file', '<cmd>enew <bar> startinsert<cr>'),
    startify.button('f', 'search files', '<cmd>Telescope find_files<cr>'),
    startify.button('g', 'search contents', '<cmd>Telescope live_grep<cr>'),
    startify.button('h', 'search help', '<cmd>Telescope help_tags<cr>')
}

startify.section.mru.val = {
    { type = "padding", val = 1 },
    { type = "text", val = "recent files", opts = { hl = "SpecialComment" } },
    { type = "padding", val = 1 },
    {
        type = "group",
        val = function()
            return { startify.mru(0) }
        end,
    },
}

startify.section.mru_cwd.val = {
    { type = "padding", val = 1 },

    {
        type = "text",
        val = 'recent files in ' .. vim.fn.getcwd(),
        opts = { hl = "SpecialComment", shrink_margin = false } },

    { type = "padding", val = 1 },

    {
        type = "group",
        val = function()
            return { startify.mru(10, vim.fn.getcwd()) }
        end,
        opts = { shrink_margin = false },
    },
}

startify.section.bottom_buttons.val = {
    startify.button('q', 'exit neovim', '<cmd>qa<cr>')
}

startify.section.footer.val = {}

require 'alpha'.setup (startify.config)
