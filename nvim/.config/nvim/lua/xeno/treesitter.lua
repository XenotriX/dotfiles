require('nvim-treesitter.configs').setup({
    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ap"] = "@parameter.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                -- You can also use captures from other query groups like `locals.scm`
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>ra"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>rA"] = "@parameter.inner",
            },
        },
        lsp_interop = {
            enable = true,
            border = 'rounded',
            floating_preview_opts = {},
            peek_definition_code = {
                ["<leader>pf"] = "@function.outer",
                ["<leader>pc"] = "@class.outer",
            },
        },
    },
})

-- Map new LSP highlight groups to treesitter highlight groups
local links = {
    ['@lsp.type.namespace'] = '@namespace',
    ['@lsp.type.type'] = '@type',
    ['@lsp.type.class'] = '@type',
    ['@lsp.type.enum'] = '@type',
    ['@lsp.type.interface'] = '@type',
    ['@lsp.type.struct'] = '@structure',
    ['@lsp.type.parameter'] = '@parameter',
    ['@lsp.type.variable'] = '@variable',
    ['@lsp.type.property'] = '@property',
    ['@lsp.type.enumMember'] = '@constant',
    ['@lsp.type.function'] = '@function',
    ['@lsp.type.method'] = '@method',
    ['@lsp.type.macro'] = '@macro',
    ['@lsp.type.decorator'] = '@function',
}
for newgroup, oldgroup in pairs(links) do
    vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end

-- Enable folding based on treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""

vim.api.nvim_set_hl(0, '@text.title.markdown', {})
vim.api.nvim_set_hl(0, '@markup.heading.1.markdown', { fg = '#ff757f', bold = true})
vim.api.nvim_set_hl(0, '@markup.heading.2.markdown', { fg = '#e0af68', bold = true})
vim.api.nvim_set_hl(0, '@markup.heading.3.markdown', { fg = '#9ece6a', bold = true})
vim.api.nvim_set_hl(0, '@markup.heading.4.markdown', { fg = '#7dcfff', bold = true})
vim.api.nvim_set_hl(0, '@markup.heading.5.markdown', { fg = '#7aa2f7', bold = true})
vim.api.nvim_set_hl(0, '@markup.heading.6.markdown', { fg = '#bb9af7', bold = true})
vim.api.nvim_set_hl(0, '@markup.raw.markdown_inline', { fg = '#ce9178', bg = '#2e3440' })
-- vim.api.nvim_set_hl(0, '@markup.raw.block.markdown', { bg = '#2e3440' })
