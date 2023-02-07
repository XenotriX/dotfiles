[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
#source /home/tibo/dotfiles/zsh/zshinit.sh

# Plugins
plug "zsh-users/zsh-completions"
plug "Aloxaf/fzf-tab"

# Aliases
alias zoom="/home/tibo/scripts/zoom_launcher.sh"
alias init_idf='. $HOME/sources/esp-idf/export.sh'
alias l="ls -1"
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls --color=tty'
alias sw='echo $(($(date +%U)-7))'
alias g='cd $(cat ~/.goto_dirs | fzf | cut -d":" -f2-)'
alias goto-save='echo -n "Name: "; read name; echo "$name: $(pwd)" >> /home/tibo/.goto_dirs'
alias cmake='cmake -D CMAKE_EXPORT_COMPILE_COMMANDS=1'
alias addr='ip addr show dev wlp82s0 | grep inet | awk "{print \$2}"'
alias ssh='TERM=xterm-256color ssh'

# Environement variables
export PATH=$PATH:/home/tibo/scripts
export PATH=$PATH:/home/tibo/.spicetify
export PATH=$PATH:/home/tibo/.local/bin

# ZSH config
export FZF_BASE=/home/tibo/source/fzf
fpath=(~/.zsh/completions $fpath)
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY
export PROMPT='%(?:%F{cyan}:%F{magenta})%B%1~%f%b$vcs_info_msg_0_ '
export EDITOR="/usr/bin/vi"
export VISUAL="/usr/bin/vi"
export LESS="-R"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Git indicator in prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%f'
zstyle ':vcs_info:*' enable git

# Automaticaly ls after cd
chpwd() {
	ls --color=always
}

# nnn
export NNN_BMS='h:~;s:~/School;d:~/Dev;.:~/dotfiles;i:/run/user/1000/gvfs/dav:host=elearning.hslu.ch,ssl=true,prefix=%2Filias%2Fwebdav.php/hslu/ILIAS/Informatik/Ausbildung/2022'
alias nnn='nnn -Rd'

n ()
{
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The backslash allows one to alias n to nnn if desired without making an
    # infinitely recursive alias
    \nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

alias n='n -Rd'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
autoload -Uz compinit && compinit
