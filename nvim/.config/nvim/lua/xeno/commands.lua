function _G.ReloadConfig()
    for name,_ in pairs(package.loaded) do
        if name:match('^xeno') then
            package.loaded[name] = nil
        end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

vim.cmd(':command! ReloadConfig lua ReloadConfig()')
