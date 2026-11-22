local ensure_installed = {
    "bash",
    "c",
    "cpp",
    "cmake",
    "css",
    "gitcommit",
    "git_config",
    "gitignore",
    "git_rebase",
    "html",
    "ini",
    "json",
    "lua",
    "make",
    "markdown",
    "python",
    "rasi",
    "tmux",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install(ensure_installed)

        -- Start treesitter for all filetypes that have a parser installed
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local bufnr = args.buf
                local filetype = args.match
                local lang = vim.treesitter.language.get_lang(filetype)
                if not lang then
                    return
                end
                if not pcall(vim.treesitter.start, bufnr, lang) then
                    return
                end
                vim.wo.foldmethod = "expr"
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo.foldtext = ""
            end,
        })

        local links = {
            ["@lsp.type.namespace"] = "@namespace",
            ["@lsp.type.type"] = "@type",
            ["@lsp.type.class"] = "@type",
            ["@lsp.type.enum"] = "@type",
            ["@lsp.type.interface"] = "@type",
            ["@lsp.type.struct"] = "@structure",
            ["@lsp.type.parameter"] = "@parameter",
            ["@lsp.type.variable"] = "@variable",
            ["@lsp.type.property"] = "@property",
            ["@lsp.type.enumMember"] = "@constant",
            ["@lsp.type.function"] = "@function",
            ["@lsp.type.method"] = "@method",
            ["@lsp.type.macro"] = "@macro",
            ["@lsp.type.decorator"] = "@function",
        }
        for newgroup, oldgroup in pairs(links) do
            vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
        end

        vim.api.nvim_set_hl(0, "@text.title.markdown", {})
        vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#ff757f", bold = true })
        vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#e0af68", bold = true })
        vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#9ece6a", bold = true })
        vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#7dcfff", bold = true })
        vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = "#7aa2f7", bold = true })
        vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = "#bb9af7", bold = true })
        vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", { fg = "#ce9178", bg = "#2e3440" })
    end,
}
