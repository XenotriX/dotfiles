return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "onsails/lspkind-nvim",
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-vsnip",
        "rafamadriz/friendly-snippets",
    },
    event = "InsertEnter",
    opts = function()
        local cmp = require("cmp")

        local kind_to_hl = {
            Text = "@text",
            Method = "@method",
            Function = "@function",
            Constructor = "@constructor",
            Field = "@field",
            Variable = "@variable",
            Class = "@type",
            Interface = "@type",
            Module = "@namespace",
            Property = "@property",
            Unit = "@number",
            Value = "@constant",
            Enum = "@type",
            Keyword = "@keyword",
            Snippet = "@keyword",
            Color = "@constant",
            File = "@text.uri",
            Reference = "@variable",
            Folder = "@text.uri",
            EnumMember = "@field",
            Constant = "@constant",
            Struct = "@type",
            Event = "@keyword",
            Operator = "@operator",
            TypeParameter = "@type",
        }

        local has_words_before = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local feedkey = function(key, mode)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
        end

        return {
            window = {
                completion = cmp.config.window.bordered({
                    col_offset = -3,
                }),
                documentation = cmp.config.window.bordered(),
            },
            view = {
                entries = { name = "custom", selection_order = "near_cursor" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if vim.fn["vsnip#available"](1) == 1 then
                        feedkey("<Plug>(vsnip-expand-or-jump)", "")
                    elseif cmp.visible() then
                        cmp.select_next_item()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function()
                    if vim.fn["vsnip#jumpable"](-1) == 1 then
                        feedkey("<Plug>(vsnip-jump-prev)", "")
                    elseif cmp.visible() then
                        cmp.select_prev_item()
                    end
                end, { "i", "s" }),
            }),
            sources = {
                { name = 'copilot' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'nvim_lua' },
                { name = 'buffer' },
                { name = 'vsnip' },
            },
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                end,
            },
            formatting = {
                format = function(entry, vim_item)
                    vim_item.abbr_hl_group = kind_to_hl[vim_item.kind]
                    vim_item.kind_hl_group = kind_to_hl[vim_item.kind]
                    vim_item = require('lspkind').cmp_format({mode = "symbol"})(entry, vim_item)
                    return vim_item
                end,
                fields = { "kind", "abbr", "menu" },
            },
        }
    end,
    config = function(_, opts)
        local cmp = require("cmp")
        cmp.setup(opts)

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
            formatting = {
                fields = { "abbr" },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            formatting = {
                fields = { "abbr" },
            },
        })
    end,
}
