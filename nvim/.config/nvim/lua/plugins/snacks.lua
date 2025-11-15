return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                keys = {
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = " ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                    },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
        explorer = { enabled = true },
        indent = {
            enabled = true,
            chunk = {
                enabled = true,
                char = {
                    corner_top = "╭",
                    corner_bottom = "╰",
                    horizontal = "─",
                    vertical = "│",
                    arrow = "▶",
                },
            },
            animate = {
                duration = { step = 5, total = 500 },
            },
        },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = {
            enabled = true,
            cursor = false,
        },
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
        statuscolumn = { enabled = true },
        words = {
            enabled = true,
            debounce = 50,
        },
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

        vim.keymap.set("n", "<leader>e", function()
            Snacks.explorer({
                layout = {
                    preset = "default",
                    preview = true,
                },
                auto_close = true,
                matcher = { sort_empty = false, fuzzy = true, frecency = true },
            })
        end, { desc = "Explorer" })

        vim.keymap.set("n", "<C-p>", function()
            Snacks.picker.files({
                layout = {
                    preset = "dropdown",
                    layout = { backdrop = true },
                },
            })
        end, { desc = "Find Files" })

        vim.keymap.set("n", "<leader>sg", function()
            Snacks.picker.grep({
                layout = { preset = "ivy_split" },
            })
        end, { desc = "Grep" })

        vim.keymap.set("n", "<leader>sr", function()
            Snacks.picker.resume()
        end, { desc = "Resume" })

        vim.keymap.set("n", "<leader>ss", function()
            Snacks.picker.lsp_symbols({
                layout = {
                    preset = "dropdown",
                    layout = { backdrop = true },
                },
                filter = { default = true },
            })
        end, { desc = "Symbols (file)" })

        vim.keymap.set("n", "<leader>sS", function()
            Snacks.picker.lsp_workspace_symbols({
                layout = {
                    preset = "dropdown",
                    layout = { backdrop = true },
                },
                filter = { default = true },
            })
        end, { desc = "Symbols (workspace)" })

        vim.keymap.set("n", "<leader>sf", function()
            Snacks.picker.lsp_symbols({
                filter = { default = { "Function", "Method" } },
            })
        end, { desc = "Functions (file)" })

        vim.keymap.set("n", "<leader>sF", function()
            Snacks.picker.lsp_workspace_symbols({
                filter = { default = { "Function", "Method" } },
            })
        end, { desc = "Functions (workspace)" })

        vim.keymap.set("n", "<leader>sc", function()
            Snacks.picker.lsp_workspace_symbols({ filter = { default = { "Class" } } })
        end, { desc = "Classes (workspace)" })

        vim.keymap.set("n", "<leader>sb", function()
            Snacks.picker.buffers()
        end, { desc = "Buffers" })

        vim.keymap.set("n", "gr", function()
            Snacks.picker.lsp_references()
        end, { desc = "References" })

        vim.keymap.set("n", "<leader>su", function()
            Snacks.picker.undo()
        end, { desc = "Undo History" })

        vim.keymap.set("n", "<leader>gl", function()
            Snacks.lazygit()
        end, { desc = "Git Commits" })

        vim.keymap.set("n", "<leader>s'", function()
            Snacks.picker.marks()
        end, { desc = "Marks" })

        vim.keymap.set("n", '<leader>s"', function()
            Snacks.picker.registers()
        end, { desc = "Registers" })

        vim.keymap.set("n", "<leader>sh", function()
            Snacks.picker.help()
        end, { desc = "Help" })

        vim.keymap.set("n", "<leader>si", function()
            Snacks.picker.icons()
        end, { desc = "Icons" })
    end,
}
