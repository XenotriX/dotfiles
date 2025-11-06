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
