return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {
        completions = { lsp = { enabled = true } },
        quote = { repeat_linebreak = true },
        bullet = { icons = { "•" } },
        checkbox = {
            unchecked = {
                icon = " ",
                highlight = "RenderMarkdownCheckboxTodo",
            },
            checked = {
                icon = " ",
                highlight = "RenderMarkdownCheckboxDone",
            },
            custom = {
                postponed = {
                    raw = "[>]",
                    rendered = " ",
                    highlight = "RenderMarkdownCheckboxRightArrow",
                },
                important = {
                    raw = "[!]",
                    rendered = " ",
                    highlight = "RenderMarkdownCheckboxImportant",
                },
                half_done = {
                    raw = "[/]",
                    rendered = " ",
                    highlight = "RenderMarkdownCheckboxHalfDone",
                },
                todo = {
                    raw = "[-]",
                    rendered = " ",
                    highlight = "RenderMarkdownCheckboxCancelled",
                    scope_highlight = "RenderMarkdownCheckboxCancelledScope",
                },
                tilde = {
                    raw = "[~]",
                    rendered = "󰰱 ",
                    highlight = "RenderMarkdownCheckboxTilde",
                },
            },
        },
        code = {
            enabled = true,
            border = "thin",
            left_pad = 1,
            right_pad = 1,
            language_left = "█",
            language_right = "█",
            width = "block",
            min_width = 78,
            position = "right",
        },
        overrides = {
            buftype = {
                -- Hide language and other decorations in LSP hover window
                nofile = {
                    render_modes = true,
                    padding = { highlight = "NormalFloat" },
                    sign = { enabled = false },
                    code = { language = false, disable_background = true },
                },
            },
        },
    },
    config = function(_, opts)
        require("render-markdown").setup(opts)

        local highlight_groups = {
            { "RenderMarkdownCheckboxTodo", { bold = true, fg = "#565f89" } },
            { "RenderMarkdownCheckboxDone", { bold = true, fg = "#9ece6a" } },
            { "RenderMarkdownCheckboxHalfDone", { bold = true, fg = "#d69929" } },
            { "RenderMarkdownCheckboxRightArrow", { bold = true, fg = "#f78c6c" } },
            { "RenderMarkdownCheckboxTilde", { bold = true, fg = "#ff5370" } },
            { "RenderMarkdownCheckboxImportant", { bold = true, fg = "#d73128" } },
            { "RenderMarkdownCheckboxCancelled", { bold = true, fg = "#565f89" } },
            { "RenderMarkdownCheckboxCancelledScope", { strikethrough = true, fg = "#565f89" } },
        }

        for _, group in ipairs(highlight_groups) do
            local name, settings = group[1], group[2]
            vim.api.nvim_set_hl(0, name, settings)
        end

        vim.o.breakindent = true
        vim.o.breakindentopt = ""
        vim.o.showbreak = "  "
    end,
}
