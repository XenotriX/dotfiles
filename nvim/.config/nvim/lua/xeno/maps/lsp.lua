local options = { noremap=true, silent=true }

local function quickfix()
    vim.lsp.buf.code_action({apply = true})
end

vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, options)
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, options)
vim.keymap.set('n', '<leader>da', vim.lsp.buf.code_action, options)
vim.keymap.set('n', '<leader>dd', quickfix, options)

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, options)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, options)

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, options)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, options)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, options)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, options)

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, options)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, options)
vim.keymap.set({'v', 'x'}, '<leader>f', vim.lsp.buf.format, options)

vim.keymap.set('n', 'gh', ':ClangdSwitchSourceHeader<CR>', options)
