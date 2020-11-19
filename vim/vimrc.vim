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
let mapleader = " "
set nowrap
let g:OmniSharp_server_use_mono = 1
let g:vim_markdown_folding_disabled = 1
set ignorecase
set smartcase

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

" Use esc to go back to normal mode from the terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif
