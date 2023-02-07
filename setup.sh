echo "Setting up dotfiles"
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
stow */
echo "Done"
