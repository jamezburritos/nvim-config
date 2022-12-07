-- plugin/lualine

require 'lualine'.setup {
    options = {
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', winbar = { 'NvimTree' } },
        fmt = string.lower
    },

    winbar = {
        lualine_c = { 'filename' }
    },

    inactive_winbar = {
        lualine_c = { 'filename' }
    },

    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filesize' },
        lualine_c = { 'branch' },

        lualine_x = { 'location' },
        lualine_y = { 'progress' },
        lualine_z = { 'filetype' }
    }
}
