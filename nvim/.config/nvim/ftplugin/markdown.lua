-- Remap j and k to gj and gk
vim.api.nvim_buf_set_keymap(0, 'n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', 'k', 'gk', { noremap = true, silent = true })

-- Set wrap and linebreak
vim.api.nvim_buf_set_option(0, 'wrap', true)
vim.api.nvim_buf_set_option(0, 'linebreak', true)
