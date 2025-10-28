require('conform').setup({
    formatters_by_ft = {
        python = { 'isort', 'black' },
        cpp = { 'clang_format' },
    },
})
