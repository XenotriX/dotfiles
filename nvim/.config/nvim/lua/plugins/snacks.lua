return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = { enabled = true },
        indent = { enabled = false },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = false },
        scroll = {
            enabled = true,
            animate = {
                duration = { step = 10, total = 100 },
                easing = "linear",
            },
            -- faster animation when repeating scroll after delay
            animate_repeat = {
                delay = 100, -- delay in ms before using the repeat animation
                duration = { step = 5, total = 50 },
                easing = "linear",
            },
        },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        image = {
            enabled = true,
            resolve = function(path, src)
               if require("obsidian.api").path_is_note(path) then
                  return require("obsidian.api").resolve_image_path(src)
               end
            end,
        },
    },
    config = function(_, opts)
        Snacks = require("snacks")
        Snacks.setup(opts)

        vim.keymap.set("n", "<leader>e",
            function()
                Snacks.explorer({
                    layout = {
                        preset = "default",
                        preview = true,
                    },
                    auto_close = true,
                    matcher = { sort_empty = false, fuzzy = true, frecency = true },
                })
            end,
            { desc = "Explorer" })

        vim.keymap.set("n", "<C-p>",
            function()
                Snacks.picker.files({
                    layout = {
                        preset = "dropdown",
                        layout = { backdrop = true },
                    }
                })
            end,
            { desc = "Find Files" })

        vim.keymap.set("n", "<leader>sg",
            function()
                Snacks.picker.grep({
                    layout = { preset = "ivy_split" }
                })
            end,
            { desc = "Grep" })

        vim.keymap.set("n", "<leader>sr",
            function()
                Snacks.picker.resume()
            end,
            { desc = "Resume" })

        vim.keymap.set("n", "<leader>ss",
            function()
                Snacks.picker.lsp_symbols({
                    layout = {
                        preset = "dropdown",
                        layout = { backdrop = true }
                    },
                    filter = { default = true }
                })
            end,
            { desc = "Symbols (file)" })

        vim.keymap.set("n", "<leader>sS",
            function()
                Snacks.picker.lsp_workspace_symbols({
                    layout = {
                        preset = "dropdown",
                        layout = { backdrop = true }
                    }
                })
            end,
            { desc = "Symbols (workspace)" })

        vim.keymap.set("n", "<leader>sf",
            function()
                Snacks.picker.lsp_symbols({
                    filter = { default = { "Function", "Method" } }
                })
            end,
            { desc = "Functions (file)" })

        vim.keymap.set("n", "<leader>sF",
            function()
                Snacks.picker.lsp_workspace_symbols({
                    filter = { default = { "Function", "Method" } }
                })
            end,
            { desc = "Functions (workspace)" })

        vim.keymap.set("n", "<leader>sc",
            function()
                Snacks.picker.lsp_workspace_symbols({ filter = { default = { "Class" } } })
            end,
            { desc = "Classes (workspace)" })

        vim.keymap.set("n", "<leader>sb",
            function()
                Snacks.picker.buffers()
            end,
            { desc = "Buffers" })

        vim.keymap.set("n", "gr",
            function()
                Snacks.picker.lsp_references()
            end,
            { desc = "References" }
        )

        vim.keymap.set("n", "<leader>su",
            function()
                Snacks.picker.undo()
            end,
            { desc = "Undo History" }
        )

        vim.keymap.set("n", "<leader>gl",
            function()
                Snacks.lazygit()
            end,
            { desc = "Git Commits" }
        )

        vim.keymap.set("n", "<leader>s'",
            function()
                Snacks.picker.marks()
            end,
            { desc = "Marks" }
        )
        
        vim.keymap.set("n", "<leader>s\"",
            function()
                Snacks.picker.registers()
            end,
            { desc = "Registers" }
        )
        -- { '<C-p>', ':lua Snacks.picker.files()<CR>', desc = "Find Files" },
        -- { '<leader>sg', ':Telescope live_grep<CR>',                                                   desc = "Find in files" },
        -- { '<leader>sr', ':Telescope resume<CR>',                                                      desc = "Resume previous search" },
        -- { '<leader>ss', ':Telescope lsp_document_symbols<CR>',                                        desc = "Symbols in file" },
        -- { '<leader>sS', ':Telescope lsp_dynamic_workspace_symbols symbols=function,method,class<CR>', desc = "Symbols in workspace" },
        -- { '<leader>sf', ':Telescope lsp_document_symbols symbols=function,method<CR>',                desc = "Functions in file" },
        -- { '<leader>sF', ':Telescope lsp_dynamic_workspace_symbols symbols=function,method<CR>',       desc = "Functions in workspace" },
        -- { '<leader>sc', ':Telescope lsp_dynamic_workspace_symbols symbols=class<CR>',                 desc = "Classes in workspace" },
        -- { '<leader>b',  ':Telescope buffers<CR>',                                                     desc = "Buffers" },
    end,
}
