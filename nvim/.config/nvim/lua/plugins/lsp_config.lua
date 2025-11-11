local function configure_servers()
    vim.lsp.config("basedpyright", {
        -- Use the uv workspace root as the project root
        root_dir = function(bufnr, on_dir)
            local fname = vim.api.nvim_buf_get_name(bufnr)
            -- Find a pyproject.toml file
            local candidates = vim.fs.find({ "pyproject.toml" }, { path = fname, upward = true, limit = math.huge })
            if #candidates > 0 then
                -- Return the top-level directory containing the pyproject.toml file
                on_dir(vim.fs.dirname(candidates[#candidates]))
                return
            end

            -- Fallback to .git directory
            local git_candidates = vim.fs.find({ ".git" }, { path = fname, upward = true })
            if #git_candidates > 0 then
                on_dir(vim.fs.dirname(git_candidates[1]))
                return
            end

            -- Use the current directory as a last resort
            on_dir(vim.fs.dirname(fname))
        end,
        settings = {
            basedpyright = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true,
                },
            },
        },
    })
end

local function configure_diagnostics()
    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.HINT] = "",
                [vim.diagnostic.severity.INFO] = "",
            },
            texthl = {
                [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            },
        },
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            header = "",
            prefix = "",
        },
        virtual_text = {
            severity = { min = vim.diagnostic.severity.ERROR },
            prefix = "",
        },
        update_in_insert = true,
        severity_sort = true,
    })
end

local function set_keymaps()
    local function quickfix()
        vim.lsp.buf.code_action({ apply = true })
    end

    local function split_then_run(cmd)
        return function()
            vim.cmd("vsplit")
            cmd()
        end
    end

    vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { silent = true, desc = "Open floating" })
    vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { silent = true, desc = "Send to quickfix" })
    vim.keymap.set("n", "<leader>da", vim.lsp.buf.code_action, { silent = true, desc = "Code Action" })
    vim.keymap.set("n", "<leader>dd", quickfix, { silent = true, desc = "Quickfix" })
    vim.keymap.set("n", "<leader>dD", vim.diagnostic.setqflist, { silent = true, desc = "Show all in quickfix" })

    vim.keymap.set("n", "[d", function()
        vim.diagnostic.jump({ count = -1 })
    end, { silent = true, desc = "Next diagnostic" })
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.jump({ count = 1 })
    end, { silent = true, desc = "Previous diagnostic" })

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true, desc = "Declaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true, desc = "Definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = true, desc = "Implementation" })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { silent = true, desc = "Type Definition" })
    vim.keymap.set("n", "gci", vim.lsp.buf.incoming_calls, { silent = true, desc = "Incoming Calls" })
    vim.keymap.set("n", "gco", vim.lsp.buf.outgoing_calls, { silent = true, desc = "Outgoing Calls" })

    vim.keymap.set("n", "gsD", split_then_run(vim.lsp.buf.declaration), { silent = true, desc = "Declaration" })
    vim.keymap.set("n", "gsd", split_then_run(vim.lsp.buf.definition), { silent = true, desc = "Definition" })
    vim.keymap.set("n", "gsi", split_then_run(vim.lsp.buf.implementation), { silent = true, desc = "Implementation" })
    vim.keymap.set("n", "gst", split_then_run(vim.lsp.buf.type_definition), { silent = true, desc = "Type Definition" })

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { silent = true, desc = "Rename" })

    vim.keymap.set("n", "gh", ":LspClangdSwitchSourceHeader<CR>", { silent = true, desc = "Switch Header/Source" })
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "mason-org/mason.nvim", config = true },
        { "mason-org/mason-lspconfig.nvim" },
        { "hrsh7th/cmp-nvim-lsp", optional = true },
    },
    config = function()
        require("mason-lspconfig").setup()

        configure_diagnostics()
        configure_servers()
        set_keymaps()
    end,
}
