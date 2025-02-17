local telescope = require('telescope')

telescope.setup({
    extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor()
    }
  }
})

vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>sg', ':Telescope live_grep<CR>', { desc = "Find in files"})
vim.keymap.set('n', '<leader>sr', ':Telescope resume<CR>', { desc = "Resume previous search"})
vim.keymap.set('n', '<leader>ss', ':Telescope lsp_document_symbols<CR>', { desc = "Symbols in file"})
vim.keymap.set('n', '<leader>sS', ':Telescope lsp_dynamic_workspace_symbols symbols=function,method,class<CR>', { desc = "Symbols in workspace"})
vim.keymap.set('n', '<leader>sf', ':Telescope lsp_document_symbols symbols=function,method<CR>', { desc = "Functions in file"})
vim.keymap.set('n', '<leader>sF', ':Telescope lsp_dynamic_workspace_symbols symbols=function,method<CR>', { desc = "Functions in workspace"})
vim.keymap.set('n', '<leader>sc', ':Telescope lsp_dynamic_workspace_symbols symbols=class<CR>', { desc = "Classes in workspace"})
vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', { desc = "Buffers"})

vim.lsp.handlers['textDocument/references'] = require('telescope.builtin').lsp_references

telescope.load_extension('fzf')
telescope.load_extension('ui-select')
