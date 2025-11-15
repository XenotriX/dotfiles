return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        {
            "SmiteshP/nvim-navic",
            opts = {
                lsp = { auto_attach = true },
                highlight = true,
            },
        },
    },
    opts = {
        options = {
            theme = "darkplus_dark",
            globalstatus = true,
            disabled_filetypes = {
                winbar = { "trouble" },
            },
            component_separators = "",
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {
                {
                    "lsp_status",
                    icon = "LSP",
                    ignore_lsp = { "copilot" },
                    show_name = false,
                },
                "encoding",
                "fileformat",
                "filetype",
                "progress",
            },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        winbar = {
            lualine_a = {
                {
                    "filetype",
                    colored = true,
                    icon_only = true,
                    color = { bg = "#0f0f0f" },
                    separator = { left = "█", right = "" },
                    padding = 0,
                },
                {
                    "filename",
                    symbols = {
                        modified = "",
                        readonly = "",
                        unnamed = "[Unnamed]",
                        newfile = "[New]",
                    },
                    separator = { left = "", right = "" },
                },
            },
            lualine_b = {
                {
                    "navic",
                    color_correction = true,
                    separator = { left = "", right = "" },
                },
            },
        },
        inactive_winbar = {
            lualine_a = {
                {
                    "filetype",
                    colored = false,
                    icon_only = true,
                    color = { bg = "#0f0f0f" },
                    separator = { left = "█", right = "" },
                    padding = 0,
                },
                {
                    "filename",
                    symbols = {
                        modified = "",
                        readonly = "",
                        unnamed = "[Unnamed]",
                        newfile = "[New]",
                    },
                    separator = { left = "", right = "" },
                    color = { bg = "#2b2b2b" },
                },
            },
            lualine_b = {
                {
                    "navic",
                    color_correction = true,
                    separator = { left = "", right = "" },
                },
            },
        },
    },
    config = function(_, opts)
        local theme = {
            normal = {
                a = { bg = "#7f00c3", fg = "#d4d4d4", gui = "bold" },
                b = { bg = "#0f0f0f", fg = "#d4d4d4" },
                c = { bg = "#1e1e1e", fg = "#d4d4d4" },
            },
        }

        opts.options.theme = theme

        require("lualine").setup(opts)
    end,
}
