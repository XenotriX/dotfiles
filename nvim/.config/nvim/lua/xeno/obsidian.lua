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
vim.keymap.set('n', '<leader>wn', ':ObsidianNew<CR>', { desc = "New Note"})
vim.keymap.set('n', '<leader>wo', ':ObsidianQuickSwitch<CR>', { desc = "Open Note"})
vim.keymap.set('n', '<leader>wf', ':ObsidianSearch<CR>', { desc = "Search Notes"})

-- -- View
vim.keymap.set('n', '<leader>wvx', ':ObsidianOpen<CR>', { desc = "View in Obsidian" })
vim.keymap.set('n', '<leader>wvb', ':ObsidianBacklinks<CR>', { desc = "Backlinks" })
vim.keymap.set('n', '<leader>wvl', ':ObsidianLinks<CR>', { desc = "Links" })
vim.keymap.set('n', '<leader>wvt', ':ObsidianTags<CR>', { desc = "Tags" })
vim.keymap.set('n', '<leader>wvd', ':ObsidianDailies -30 1<CR>', { desc = "Daily notes" })

-- -- Edit
vim.keymap.set('n', '<leader>wei', ':ObsidianInsertImage<CR>', { desc = "Insert Image" })
vim.keymap.set('n', '<leader>wel', ':ObsidianLink<CR>', { desc = "Insert Link" })
vim.keymap.set({ 'n', 'v' }, '<leader>wex', ':ObsidianExtract<CR>', { desc = "Extract Note" })
vim.keymap.set('n', '<leader>wer', ':ObsidianRename<CR>', { desc = "Rename Note" })
vim.keymap.set('n', '<leader>wen', ':ObsidianInsertLinkNew<CR>', { desc = "Insert Link (New)" })
