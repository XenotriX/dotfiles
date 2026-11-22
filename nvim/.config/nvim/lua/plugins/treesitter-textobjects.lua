return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
        select = {
            lookahead = true,
            selection_modes = {
                ["@parameter.outer"] = "v",
                ["@function.outer"] = "V",
                ["@class.outer"] = "V",
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter-textobjects").setup(opts)
        local select = require("nvim-treesitter-textobjects.select")
        local swap = require("nvim-treesitter-textobjects.swap")

        -- Select textobjects
        vim.keymap.set({ "x", "o" }, "af", function()
            select.select_textobject("@function.outer")
        end, { desc = "Select outer function" })

        vim.keymap.set({ "x", "o" }, "if", function()
            select.select_textobject("@function.inner")
        end, { desc = "Select inner function" })

        vim.keymap.set({ "x", "o" }, "ac", function()
            select.select_textobject("@class.outer")
        end, { desc = "Select outer class" })

        vim.keymap.set({ "x", "o" }, "ic", function()
            select.select_textobject("@class.inner")
        end, { desc = "Select inner class" })

        vim.keymap.set({ "x", "o" }, "ap", function()
            select.select_textobject("@parameter.outer")
        end, { desc = "Select outer parameter" })

        vim.keymap.set({ "x", "o" }, "as", function()
            select.select_textobject("@scope", "locals")
        end, { desc = "Select language scope" })

        -- Swap parameters
        vim.keymap.set("n", "<leader>ra", function()
            swap.swap_next("@parameter.inner")
        end, { desc = "Swap parameter with next" })

        vim.keymap.set("n", "<leader>rA", function()
            swap.swap_previous("@parameter.inner")
        end, { desc = "Swap parameter with previous" })
    end,
}
