return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    enabled = false,
    opts = {
        sort_by = "case_sensitive",
        view = {
            adaptive_size = true,
            side = "right",
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
            },
        },
        update_cwd = true,
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)

            vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
            vim.keymap.set("n", "<CR", api.node.open.edit, opts("Open"))
            vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
            vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
        end,
    },
    keys = {
        {
            "<leader>e",
            ":NvimTreeFindFileToggle<CR>",
            silent = true,
            desc = "Toggle file tree",
        },
    },
}
