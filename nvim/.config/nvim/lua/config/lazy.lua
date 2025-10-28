-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.timeoutlen = 500
vim.o.undofile = true
vim.o.termguicolors = true
vim.o.swapfile = false
vim.o.mouse = 'a'

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true

vim.o.wrap = false
vim.o.numberwidth = 2

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.pumheight = 10

vim.o.cursorline = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.foldlevel = 99
vim.o.conceallevel = 2
vim.g['Hexokinase_highlighters'] = { 'foregroundfull' }
vim.g['vim_markdown_new_list_item_indent'] = 2
vim.g['vim_markdown_math'] = 1
vim.g['vim_markdown_folding_level'] = 1
vim.g['surround_98'] = '**\r**'

vim.cmd [[ autocmd BufRead,BufNewFile *.slint set filetype=slint ]]

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
