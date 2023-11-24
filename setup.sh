if [ $0 != './setup.sh' ]; then
    echo "Please run the setup script from within the dotfiles directory"
    exit 1
fi

echo "Setting up dotfiles"
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
#stow */
if [ ! -f /usr/share/X11/xkb/symbols/real-prog-dvorak ]; then
    sudo sh -c 'curl -fsSL https://raw.githubusercontent.com/ThePrimeagen/keyboards/master/ubuntu/real-prog-dvorak > /usr/share/X11/xkb/symbols/real-prog-dvorak'
fi
echo "Done"
