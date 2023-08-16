require('xeno.maps.maps')
require('xeno.maps.refactoring')

vim.api.nvim_set_keymap('n', '<leader>m', ':make<CR>', {noremap = true})
vim.o.makeprg = 'make -j4'
