set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'scrooloose/nerdtree'

Plug 'HerringtonDarkholme/yats.vim'

Plug 'posva/vim-vue'

Plug 'mattn/emmet-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

filetype plugin indent on

so ~/dotfiles/vim/vimrc.vim
