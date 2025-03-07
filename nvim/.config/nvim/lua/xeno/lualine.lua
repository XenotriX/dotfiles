require('lualine').setup {
    options = {
        theme = 'darkplus_dark',
        -- section_separators = '',
        globalstatus = true,
    },
    winbar = {
        lualine_a = {
            {
                'filetype',
                colored = true,
                icon_only = true,
            },
        },
        lualine_b = { 'filename', 'navic' },
    },
    inactive_winbar = {
        lualine_a = {
            {
                'filetype',
                colored = false,
                icon_only = true,
            },
        },
        lualine_b = { 'filename', 'navic' },
    },
}
