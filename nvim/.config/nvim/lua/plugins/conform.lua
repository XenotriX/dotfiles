return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            python = { "isort", "ruff_fix", "ruff_format" },
            cpp = { "clang_format" },
            lua = { "stylua" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        formatters = {
            ruff_format = {
                args = { "format", "--preview", "--stdin-filename", "$FILENAME", "-" },
            }
        }
    },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            silent = true,
            desc = "Format File",
        },
    },
}
