return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            python = { 'isort', 'black' },
            cpp = { 'clang_format' },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
    cmd = { "ConformInfo" },
    keys = {
        {
            '<leader>f',
            function()
                require('conform').format({ async = true })
            end,
            silent = true,
            desc = "Format File"
        },
    },
}
