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

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = { 'utf-16' }

-- The following example advertise capabilities to `clangd`.
require('lspconfig').clangd.setup {
    capabilities = capabilities,
    cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy'
    }
}

require('lspconfig').tsserver.setup {
    capabilities = capabilities,
}

require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities,
}

require('lspconfig')['pylsp'].setup {
    capabilities = capabilities,
}

require('lspconfig').dartls.setup {
    capabilities = capabilities,
}

require('lspconfig').dockerls.setup {
    capabilities = capabilities,
}

require('lspconfig').gdscript.setup{
    capabilities = capabilities,
}

require('lspconfig').html.setup{
    capabilities = capabilities,
}

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn",  text = "" },
    { name = "DiagnosticSignHint",  text = "" },
    { name = "DiagnosticSignInfo",  text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

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
