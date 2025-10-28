return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "natecraddock/telescope-zf-native.nvim",
        'nvim-telescope/telescope-ui-select.nvim',
    },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<esc>"] = require('telescope.actions').close
                },
            },
            path_display = { "filename_first" }
        },
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_cursor()
            }
        }
    },
    init = function()
        local telescope = require('telescope')
        telescope.load_extension('zf-native')
        telescope.load_extension('ui-select')
    end,
    keys = {
        { '<C-p>',      ':Telescope find_files<CR>',                                                  desc = "Find Files" },
        { '<leader>sg', ':Telescope live_grep<CR>',                                                   desc = "Find in files" },
        { '<leader>sr', ':Telescope resume<CR>',                                                      desc = "Resume previous search" },
        { '<leader>ss', ':Telescope lsp_document_symbols<CR>',                                        desc = "Symbols in file" },
        { '<leader>sS', ':Telescope lsp_dynamic_workspace_symbols symbols=function,method,class<CR>', desc = "Symbols in workspace" },
        { '<leader>sf', ':Telescope lsp_document_symbols symbols=function,method<CR>',                desc = "Functions in file" },
        { '<leader>sF', ':Telescope lsp_dynamic_workspace_symbols symbols=function,method<CR>',       desc = "Functions in workspace" },
        { '<leader>sc', ':Telescope lsp_dynamic_workspace_symbols symbols=class<CR>',                 desc = "Classes in workspace" },
        { '<leader>b',  ':Telescope buffers<CR>',                                                     desc = "Buffers" },
    },
}
