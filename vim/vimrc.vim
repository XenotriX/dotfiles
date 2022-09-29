""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""

filetype plugin indent on
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent

" Line numbering
set number
set relativenumber

" NERDTree
let NERDTreeShowHidden=1

" MISC
set cursorline
set hlsearch
syntax on
colorscheme onedark
let mapleader = "\<Space>"
set nowrap
let g:OmniSharp_server_use_mono = 1
let g:vim_markdown_folding_level = 1

set foldlevel=99
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2
let g:Hexokinase_highlighters = ['backgroundfull']
"let g:coc_disable_startup_warning = 1
let g:goyo_linenr = 1
set ignorecase
set smartcase
set undofile

" Useful for plugin development
set rtp+=.

" QuickScope colors
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

""""""""""""""""""""""
"    Key bindings    "
""""""""""""""""""""""

" Quickly exit insert mode
imap jk <esc>
imap kj <esc>

" Trigger whichkey
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" Quickly open a file
nnoremap <C-P> :Files<CR>

" Move around splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

" Toggle NERDTree
map <C-M> :NERDTreeToggle<cr>

" Whichkey
let g:which_key_map = {}
let g:which_key_map['a'] = 'Code Action'
let g:which_key_map['f'] = 'Format Code'
let g:which_key_map['s'] = {
    \'name': '+Show',
    \'s': 'Symbols',
    \'o': 'Outline',
    \'d': 'Diagnostics',
    \}
let g:which_key_map['qf'] = 'Quick Fix'
let g:which_key_map['q'] = {'name': 'which_key_ignore'}
let g:which_key_map['c'] = {'name': '+NERDCommenter'}
let g:which_key_map['h'] = {'name': '+GitGutter'}
let g:which_key_map['rn'] = 'Rename'
let g:which_key_map['gh'] = 'Switch Header/Source'
let g:which_key_map['r'] = {'name': 'which_key_ignore'}
call which_key#register('<Space>', 'g:which_key_map')

" Use esc to go back to normal mode from the terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif


" Colorscheme
hi mkdHeading guifg=DimGray
hi htmlH1 gui=Bold guifg=white
hi htmlH2 gui=Bold guifg=DeepSkyBlue
hi htmlH3 gui=Bold guifg=SkyBlue

command Wirth %s/\(\S\) (/\1(/g
