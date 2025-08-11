local gs = require('gitsigns')

-- Setup
gs.setup({
    signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
})

-- Keymaps
vim.keymap.set({ 'n', 'v' }, '<leader>gs', ':Gitsigns stage_hunk<CR>', { desc = 'Stage hunk' })
vim.keymap.set({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset hunk' })
vim.keymap.set('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage buffer' })
vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
vim.keymap.set('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset buffer' })
vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { desc = 'Preview hunk' })
vim.keymap.set('n', '<leader>gB', function() gs.blame_line { full = true } end, { desc = 'Show full blame' })
vim.keymap.set('n', '<leader>gb', gs.toggle_current_line_blame, { desc = 'Toggle line blame' })
vim.keymap.set('n', '<leader>gd', function() gs.diffthis('HEAD') end, { desc = 'Diff (HEAD)' })
vim.keymap.set('n', '<leader>gD', function() gs.diffthis('~') end, { desc = 'Diff (~)' })
vim.keymap.set('n', '<leader>gtd', gs.toggle_deleted, { desc = 'Toggle deleted' })
vim.keymap.set('n', '<leader>gq', function() gs.setqflist('all') end, { desc = 'Add hunks to quickfix' })

-- Navigation
vim.keymap.set('n', ']h', function()
    if vim.wo.diff then return ']h' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
end, { expr = true, desc = 'Next hunk' })

vim.keymap.set('n', '[h', function()
    if vim.wo.diff then return '[h' end
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
end, { expr = true, desc = 'Previous hunk' })
