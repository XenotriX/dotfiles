require('toggleterm').setup({
    open_mapping = [[<c-t>]],
    direction = 'float',
    float_opts = {
    border = 'curved',
winblend = 5,
  },
})

local options = {noremap=true}

vim.keymap.set('t', '<esc>', '<C-\\><C-n>', options)
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', options)
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', options)
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', options)
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', options)
