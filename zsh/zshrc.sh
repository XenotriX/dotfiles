# Theme
export ZSH_THEME="robbyrussell"

# Plugin
plugins=()

# automaticaly ls after cd
chpwd() {
	ls --color=always
}

# Default Editor
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
