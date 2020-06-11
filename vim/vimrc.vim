""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""

filetype plugin indent on
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

" Line numbering
set number
set relativenumber

" NERDTree
let NERDTreeShowHidden=1

" MISC
set hlsearch
syntax on
colorscheme onedark
let mapleader = " "

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
