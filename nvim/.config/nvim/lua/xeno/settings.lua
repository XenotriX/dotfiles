local o = vim.o

o.timeoutlen = 500
o.undofile = true
o.termguicolors = true
o.swapfile = false
o.mouse = 'a'

o.splitbelow = true
o.splitright = true

o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true
o.autoindent = true

o.wrap = false
o.numberwidth = 2

o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.pumheight = 10

o.cursorline = true

o.ignorecase = true
o.smartcase = true

vim.cmd('colorscheme darkplus')
o.foldlevel = 99
o.conceallevel = 2
vim.g['Hexokinase_highlighters'] = {'foregroundfull'}
vim.g['vim_markdown_new_list_item_indent'] = 2
vim.g['vim_markdown_math'] = 1
vim.g['vim_markdown_folding_level'] = 1
