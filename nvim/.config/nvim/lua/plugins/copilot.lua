return {
    'zbirenbaum/copilot.lua',
    opts = {
        panel = { enabled = false },
        suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
                accept = "<C-h>",
                accept_word = "<C-l>",
                accept_line = false,
                next = "<C-j>",
                prev = "<C-k>",
                dismiss = "<C-]>",
            },
        },

    }
}
