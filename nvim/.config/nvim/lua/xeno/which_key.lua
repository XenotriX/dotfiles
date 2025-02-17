local wk = require("which-key")

require('which-key').setup {
    preset = 'helix',
    plugins = {
        spelling = {
            enabled = true,
            suggestions = 20,
        },
        presets = {
            operators = false,
            motions = false,
            text_objects = false,
            g = false,
        },
    },
}

wk.add({
    { "<leader>g", group = "Git" },
    { "<leader>d",   group = "Diagnostics" },
    { "<leader>m",   desc = "Make" },
    { "<leader>p",   group = "Peek" },
    { "<leader>pc",  desc = "Class" },
    { "<leader>pf",  desc = "Function" },
    { "<leader>r",   group = "Refactor" },
    { "<leader>rA",  desc = "Swap args (left)" },
    { "<leader>ra",  desc = "Swap args (right)" },
    { "<leader>s",   group = "Search" },
    { "<leader>w",   group = "Wiki (Obsidian)" },
    { "<leader>we",  group = "Edit" },
    { "<leader>wv",  group = "View" },
    { "<leader>z",   desc = "Zen Mode" },
    { "<leader>q", group = "Quickfix"},
    { "g",  group = "Goto" },
})
