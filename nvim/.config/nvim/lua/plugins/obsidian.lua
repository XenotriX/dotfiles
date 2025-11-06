return {
    'obsidian-nvim/obsidian.nvim',
    opts = {
        attachments = {
            img_folder = "/",
        },
        workspaces = {
            {
                name = "wiki",
                path = "~/Documents/Wiki",
            },
        },
        legacy_commands = false,
        disable_frontmatter = false,
            note_frontmatter = {
                func = function(note)
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
        },
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
        ui = { enable = false },
        checkbox = {
            order = { " ", "/", "x", "-", "!" , ">" , "~" },
        },
        daily_notes = {
            folder = "Daily Notes",
        }
    },
    cmd = {
        'Obsidian',
    },
    keys = {
        -- -- New note
        { '<leader>wn',  ':Obsidian new<CR>',           desc = "New Note" },
        { '<leader>wo',  ':Obsidian quick_switch<CR>',   desc = "Open Note" },
        { '<leader>wf',  ':Obsidian search<CR>',        desc = "Search Notes" },
        { '<leader>wt',  ':Obsidian today<CR>',         desc = "Today's Note" },

        -- -- View
        { '<leader>wvx', ':Obsidian open<CR>',          desc = "View in Obsidian" },
        { '<leader>wvb', ':Obsidian backlinks<CR>',     desc = "Backlinks" },
        { '<leader>wvl', ':Obsidian links<CR>',         desc = "Links" },
        { '<leader>wvt', ':Obsidian tags<CR>',          desc = "Tags" },
        { '<leader>wvd', ':Obsidian dailies -30 1<CR>', desc = "Daily notes" },

        -- -- Edit
        { '<leader>wei', ':Obsidian insert_image<CR>',   desc = "Insert Image" },
        { '<leader>wel', ':Obsidian link<CR>',          desc = "Insert Link" },
        { '<leader>wex', ':Obsidian extract<CR>',       desc = "Extract Note",     mode = { 'n', 'v' } },
        { '<leader>wer', ':Obsidian rename<CR>',        desc = "Rename Note" },
        { '<leader>wen', ':Obsidian insert_link_new<CR>', desc = "Insert Link (New)" },
    }
}
