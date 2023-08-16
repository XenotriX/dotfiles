local g = vim.g

g['vimtex_view_method'] = 'zathura'
g['vimtex_quickfix_autoclose_after_keystrokes'] = 1
g['vimtex_compiler_latexmk'] = {
    build_dir = 'build',
    options = {
        '-shell-escape'
    }
}
