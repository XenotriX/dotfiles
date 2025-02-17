local function toggle_quickfix()
    local windows = vim.fn.getwininfo()
    for _, win in pairs(windows) do
        if win["quickfix"] == 1 then
            vim.cmd.cclose()
            return
        end
    end
    vim.cmd.copen()
end

vim.keymap.set('n', '<leader>qq', toggle_quickfix, { desc = "Toggle Quickfix Window" })
vim.keymap.set('n', '<leader>qn', ':cnext<CR>', { desc = "Next quickfix location"})
vim.keymap.set('n', '<leader>qp', ':cprev<CR>', { desc = "Previous quickfix location"})
