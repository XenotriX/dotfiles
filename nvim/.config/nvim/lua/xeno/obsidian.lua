require('obsidian').setup({
    workspaces = {
        {
            name = "wiki",
            path = "~/Documents/Wiki",
        },
    },
    disable_frontmatter = false,
    note_frontmatter_func = function(note)
        local out = {}

        if note.tags ~= nil and not vim.tbl_isempty(note.tags) then
            out["tags"] = note.tags
        end

        if note.aliases ~= nil and not vim.tbl_isempty(note.aliases) then
            out["aliases"] = note.aliases
        end

        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
            for key, value in pairs(note.metadata) do
                out[key] = value
            end
        end

        return out
    end,
    note_id_func = function(title)
        if title ~= nil then
            -- If title is given, transform it into valid file name.
            -- return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            return title
        end

        -- If title is nil, generate a unique ID.
        local id = ""
        for _ = 1, 4 do
            id = id .. string.char(math.random(65, 90))
        end

        return tostring(os.time()) .. "-" .. id
    end,
    ui = {
        checkboxes = {
            [" "] = { char = "", hl_group = "ObsidianTodo" },
            ["x"] = { char = "", hl_group = "ObsidianDone" },
            [">"] = { char = "", hl_group = "ObsidianRightArrow" },
            ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
            ["!"] = { char = "", hl_group = "ObsidianImportant" },
            ["/"] = { char = "", hl_group = "ObsidianHalfDone" },
            ["-"] = { char = "", hl_group = "ObsidianCancelled" },
        },
        hl_groups = {
            -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
            ObsidianTodo = { bold = true, fg = "#565f89" },
            ObsidianDone = { bold = true, fg = "#9ece6a" },
            ObsidianHalfDone = { bold = true, fg = "#d69929" },
            ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
            ObsidianTilde = { bold = true, fg = "#ff5370" },
            ObsidianImportant = { bold = true, fg = "#d73128" },
            ObsidianCancelled = { bold = true, fg = "#565f89" },
            ObsidianBullet = { bold = true, fg = "#89ddff" },
            ObsidianRefText = { underline = true, fg = "#c792ea" },
            ObsidianExtLinkIcon = { fg = "#c792ea" },
            ObsidianTag = { italic = true, fg = "#89ddff" },
            ObsidianBlockID = { italic = true, fg = "#89ddff" },
            ObsidianHighlightText = { bg = "#75662e" },
        },
    }
})

-- Keybindings

-- -- New note
vim.api.nvim_set_keymap('n', '<leader>wn', ':ObsidianNew<CR>', { noremap = true, silent = true })

-- -- Open note
vim.api.nvim_set_keymap('n', '<leader>wo', ':ObsidianQuickSwitch<CR>', { noremap = true, silent = true })

-- -- Search notes
vim.api.nvim_set_keymap('n', '<leader>wf', ':ObsidianSearch<CR>', { noremap = true, silent = true })

-- -- View

-- -- -- View in Obsidian
vim.api.nvim_set_keymap('n', '<leader>wvx', ':ObsidianOpen<CR>', { noremap = true, silent = true })

-- -- -- View backlinks
vim.api.nvim_set_keymap('n', '<leader>wvb', ':ObsidianBacklinks<CR>', { noremap = true, silent = true })

-- -- -- View links
vim.api.nvim_set_keymap('n', '<leader>wvl', ':ObsidianLinks<CR>', { noremap = true, silent = true })

-- -- -- View tags
vim.api.nvim_set_keymap('n', '<leader>wvt', ':ObsidianTags<CR>', { noremap = true, silent = true })

-- -- -- View daily notes
vim.api.nvim_set_keymap('n', '<leader>wvd', ':ObsidianDailies -30 1<CR>', { noremap = true, silent = true })

-- -- Edit

-- -- -- Insert image
vim.api.nvim_set_keymap('n', '<leader>wei', ':ObsidianInsertImage<CR>', { noremap = true, silent = true })

-- -- -- Insert link
vim.api.nvim_set_keymap('n', '<leader>wel', ':ObsidianLink<CR>', { noremap = true, silent = true })

-- -- -- Extract note
vim.api.nvim_set_keymap('n', '<leader>wex', ':ObsidianExtract<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>wex', ':ObsidianExtract<CR>', { noremap = true, silent = true })

-- -- -- Rename note
vim.api.nvim_set_keymap('n', '<leader>wer', ':ObsidianRename<CR>', { noremap = true, silent = true })

-- -- -- Insert link (Create)
vim.api.nvim_set_keymap('n', '<leader>wen', ':ObsidianInsertLinkNew<CR>', { noremap = true, silent = true })
