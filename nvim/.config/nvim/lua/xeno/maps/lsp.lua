local function quickfix()
    vim.lsp.buf.code_action({ apply = true })
end

vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { silent = true, desc = "Open floating" })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { silent = true, desc = "Sent to quickfix" })
vim.keymap.set('n', '<leader>da', vim.lsp.buf.code_action, { silent = true, desc = "Code Action" })
vim.keymap.set('n', '<leader>dd', quickfix, { silent = true, desc = "Quickfix" })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { silent = true, desc = "Next diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { silent = true, desc = "Previous diagnostic" })

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { silent = true, desc = "Declaration" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, desc = "Definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { silent = true, desc = "Implementation" })
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { silent = true, desc = "Type Definition" })
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { silent = true, desc = "References" })

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { silent = true, desc = "Rename" })
-- vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { silent = true, desc = "Format File" })
vim.keymap.set('n', '<leader>f', require('conform').format, { silent = true, desc = "Format File" })
vim.keymap.set({ 'v', 'x' }, '<leader>f', vim.lsp.buf.format, { silent = true, desc = "Format" })

vim.keymap.set('n', 'gh', ':ClangdSwitchSourceHeader<CR>', { silent = true, desc = "Switch Header/Source" })
