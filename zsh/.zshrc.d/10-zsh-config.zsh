# ZSH config
fpath=(~/.zsh/completions $fpath)
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY
export EDITOR="/usr/bin/vi"
export VISUAL="/usr/bin/vi"
export LESS="-R"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''
export HISTORY_SUBSTRING_SEARCH_PREFIXED=1
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Edit command in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey "^H" delete-char
bindkey "^?" backward-delete-char

# Delete word stops on /
autoload -U select-word-style
select-word-style bash

# Automaticaly ls after cd
chpwd() {
	ls --color=always
}

autoload -Uz compinit && compinit
