-- Use lsp as source for cmp
--require('cmp').setup {
--  sources = {
--    { name = 'nvim_lsp' }
--  }
--}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup()

local function extra_args()
    local virtual = os.getenv("VIRTUAL_ENV") or "/usr"
    return { "--python-executable", virtual .. "/bin/python3", true }
end

vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                pylsp_mypy = {
                    enabled = true,
                    overrides = extra_args(),
                    report_progress = true,
                    live_mode = true,
                },
                pylsp_rope = { enabled = true },
                pylsp_code_actions = { enabled = true },
                python_lsp_ruff = { enabled = true, formatEnabled = true },
            }
        }
    }
})


vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = '',
        },
        texthl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
        },
        -- numhl = {
        --     [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
        --     [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
        --     [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
        --     [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
        -- },
    },
})

vim.diagnostic.config({
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        header = '',
        prefix = '',
    },
    virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR }
    }
})
