local vim = vim
local api = vim.api

local function update_open_buffers(path)
    -- Update the path of all open buffers
    local buf_count = api.nvim_list_bufs()
    for _, buf in ipairs(buf_count) do
        local filepath = api.nvim_buf_get_name(buf)
        if filepath ~= "" then
            local filename = api.nvim_call_function('fnamemodify', { filepath, ':.'})
            local new_filepath = path .. filename
            api.nvim_buf_set_name(buf, new_filepath)
        end
    end
end


-- Make the switch_to_worktree function global
switch_to_worktree = function(name)
    -- Check if the worktree already exists
    local worktrees = api.nvim_call_function('system', { 'git worktree list' })
    print(worktrees)
    worktrees = vim.split(worktrees, '\n', true) -- Split the string into lines
    for _, line in ipairs(worktrees) do
        local worktree_path, worktree_name = string.match(line, '^(%S+) *.*%[(.*)%]')
        if worktree_name == name then
            -- Switch to the existing worktree
            api.nvim_command('cd ' .. worktree_path)

            -- Update the path of all open buffers
            update_open_buffers(worktree_path)

            print('Switched to worktree: ' .. name)
            return
        end
    end

    -- Create a new worktree and switch to it
    api.nvim_call_function('system', { 'git worktree add ' .. name })
    api.nvim_command('cd ' .. name)
    print('Created and switched to worktree: ' .. name)
end


local function main()
    -- Define the :Worktree command
    vim.cmd [[command! -nargs=1 Worktree lua switch_to_worktree(<f-args>)]]
end

main()
