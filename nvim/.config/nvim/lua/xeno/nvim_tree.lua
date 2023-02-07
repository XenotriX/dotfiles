-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        side = 'right',
        mappings = {
            list = {
                { key = { 'l', '<CR', 'o' }, action = 'edit'},
                { key = 'h', action = 'close_node'},
            }
        }
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    diagnostics = {
        enable = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    }
})

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', {noremap = true, silent = true});
