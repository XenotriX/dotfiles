return {
    "lunarvim/darkplus.nvim",
    config = function()
        vim.cmd.colorscheme("darkplus")
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#597e75" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#8d6d60" })
    end,
}
