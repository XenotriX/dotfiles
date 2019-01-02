# Theme
export ZSH_THEME="robbyrussell"

# Plugin
plugins=()

# automaticaly ls after cd
chpwd() {
	ls --color=always
}

# Default Editor
export EDITOR="/usr/bin/vim"
export VISUAL="/usr/bin/vim"
