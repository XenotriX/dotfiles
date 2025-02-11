local map = vim.api.nvim_set_keymap

-- map the leader key
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

-- General
map('v', '>', '>gv', {noremap=true}) -- Keep selection when moving text
map('v', '<', '<gv', {noremap=true})

-- Moving between windows
map('n', '<C-h>', '<C-w>h', {noremap=true})
map('n', '<C-j>', '<C-w>j', {noremap=true})
map('n', '<C-k>', '<C-w>k', {noremap=true})
map('n', '<C-l>', '<C-w>l', {noremap=true})

-- Don't override reg when pasting
map('v', 'p', '"_dP', {noremap=true})

-- Center cursor when moving pagewise
map('n', '<C-d>', '<C-d>zz', {noremap=true})
map('n', '<C-u>', '<C-u>zz', {noremap=true})

-- Zen mode
map('n', '<leader>z', ':ZenMode<CR>', {noremap=true})

-- Toggle outline
map('n', '<leader>o', ':Outline<CR>', {noremap=true})

require('xeno.maps.telescope')
require('xeno.maps.lsp')
require('xeno.maps.refactoring')
require('xeno.maps.quickfix')
