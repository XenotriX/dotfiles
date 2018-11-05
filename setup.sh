echo "Setting up dotfiles"
echo "source $HOME/dotfiles/zsh/zshinit.sh" > ~/.zshrc
echo "so $HOME/dotfiles/vim/setup.vim" > ~/.vimrc
git config --global include.path "$HOME/dotfiles/git/.gitconfig"
echo "Done"
