local telescope = require('telescope')
local options = { noremap = true }

telescope.setup({
    extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor()
    }
  }
})

vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', options)
vim.keymap.set('n', '<leader>sg', ':Telescope live_grep<CR>', options)
vim.keymap.set('n', '<leader>sr', ':Telescope resume<CR>', options)
vim.keymap.set('n', '<leader>ss', ':Telescope lsp_document_symbols<CR>', options)
vim.keymap.set('n', '<leader>sS', ':Telescope lsp_dynamic_workspace_symbols symbols=function,method,class<CR>', options)
vim.keymap.set('n', '<leader>sf', ':Telescope lsp_document_symbols symbols=function,method<CR>', options)
vim.keymap.set('n', '<leader>sF', ':Telescope lsp_dynamic_workspace_symbols symbols=function,method<CR>', options)
vim.keymap.set('n', '<leader>sc', ':Telescope lsp_dynamic_workspace_symbols symbols=class<CR>', options)

vim.lsp.handlers['textDocument/references'] = require('telescope.builtin').lsp_references

telescope.load_extension('fzf')
telescope.load_extension('ui-select')
