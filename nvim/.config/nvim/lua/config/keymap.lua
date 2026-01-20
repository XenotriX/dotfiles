-- map the leader key
vim.g.mapleader = " " -- 'vim.g' sets global variables

-- General
vim.keymap.set("v", ">", ">gv") -- Keep selection when moving text
vim.keymap.set("v", "<", "<gv")

-- Moving between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Don't override reg when pasting
vim.keymap.set("v", "p", '"_dP')

-- Quickfix
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

vim.keymap.set("n", "<leader>qq", toggle_quickfix, { desc = "Toggle Quickfix Window" })
vim.keymap.set("n", "<leader>qn", ":cnext<CR>", { desc = "Next quickfix location" })
vim.keymap.set("n", "<leader>qp", ":cprev<CR>", { desc = "Previous quickfix location" })
vim.keymap.set(
    "n",
    "*",
    ":let @/= '\\<' . expand('<cword>') . '\\>' <bar> set hls <cr>",
    { silent = true, desc = "Search word under cursor" }
)
