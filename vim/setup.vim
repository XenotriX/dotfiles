set nocompatible
filetype off

set rtp+=~/dotfiles/vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'HerringtonDarkholme/yats.vim'

Plugin 'posva/vim-vue'

call vundle#end()
filetype plugin indent on

so ~/dotfiles/vim/vimrc.vim
