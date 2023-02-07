local gs = require('gitsigns')
local wk = require('which-key')

-- Setup
gs.setup()

-- Keymaps
vim.keymap.set({'n', 'v'}, '<leader>gs', ':Gitsigns stage_hunk<CR>')
vim.keymap.set({'n', 'v'}, '<leader>gr', ':Gitsigns reset_hunk<CR>')
vim.keymap.set('n', '<leader>gS', gs.stage_buffer)
vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk)
vim.keymap.set('n', '<leader>gR', gs.reset_buffer)
vim.keymap.set('n', '<leader>gp', gs.preview_hunk)
vim.keymap.set('n', '<leader>gB', function() gs.blame_line{full=true} end)
vim.keymap.set('n', '<leader>gb', gs.toggle_current_line_blame)
vim.keymap.set('n', '<leader>gd', function() gs.diffthis('HEAD') end)
vim.keymap.set('n', '<leader>gD', function() gs.diffthis('~') end)
vim.keymap.set('n', '<leader>td', gs.toggle_deleted)

-- Navigation
vim.keymap.set('n', ']h', function()
    if vim.wo.diff then return ']h' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
end, {expr=true})

vim.keymap.set('n', '[h', function()
    if vim.wo.diff then return '[h' end
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
end, {expr=true})

-- Whichkey
wk.register({
    g = {
        name = 'Git',
        s = 'Stage hunk',
        r = 'Reset hunk',
        S = 'Stage buffer',
        u = 'Undo stage hunk',
        R = 'Reset buffer',
        p = 'Preview hunk',
        b = 'Toggle line blame',
        B = 'Show full blame',
        d = 'Diff (HEAD)',
        D = 'Diff (~)',
    }
}, {prefix = '<leader>'})

wk.register({
    ['[h'] = 'Previous hunk',
    [']h'] = 'Next hunk',
})
