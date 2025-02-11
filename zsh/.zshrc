[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/z/z.sh

# Plugins
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-history-substring-search"
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
alias addr='ip addr show dev wlp82s0 | grep inet | awk "{print \$2}"'
alias ssh='TERM=xterm-256color ssh'
alias t='task'
alias wk='nvim +ObsidianQuickSwitch'

# Environement variables
export PATH=$PATH:/home/tibo/scripts
export PATH=$PATH:/home/tibo/.spicetify
export PATH=$PATH:/home/tibo/.local/bin
export PATH=$PATH:/home/tibo/.cargo/bin
export STRACK_DATA=/home/tibo/Documents/Share/strack_data.json

# ZSH config
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
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''
export HISTORY_SUBSTRING_SEARCH_PREFIXED=1
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Git indicator in prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%f'
zstyle ':vcs_info:*' enable git

# Edit command in editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Delete word stops on /
autoload -U select-word-style
select-word-style bash

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

autoload -Uz compinit && compinit

# Expand ue4cli
ue() {
	ue4cli=$HOME/.local/bin/ue4
	engine_path=$($ue4cli root)

  # cd to ue location
	if [[ "$1" == "engine" ]]; then
		cd $engine_path
  # combine clean and build in one command
	elif [[ "$1" == "rebuild" ]]; then
		$ue4cli clean
		$ue4cli build 
		if [[ "$2" == "run" ]]; then
			$ue4cli run
		fi
  # build and optionally run while respecting build flags
	elif [[ "$1" == "build" ]]; then
		if [[ "${@: -1}" == "run" ]]; then
			length="$(($# - 2))" # Get length without last param because of 'run'
			$ue4cli build ${@:2:$length}
			$ue4cli run
		else
			shift 1
			$ue4cli build "$@"
		fi
  # Run project files generation, create a symlink for the compile database and fix-up the compile database
	elif [[ "$1" == "gen" ]]; then
		$ue4cli gen
		project=${PWD##*/}
		cat ".vscode/compileCommands_${project}.json" | python -c 'import json,sys
j = json.load(sys.stdin)
for o in j:
  file = o["file"]
  arg = o["arguments"][1]
  o["arguments"] = ["clang++", "-std=c++20", "-ferror-limit=0", "-Wall", "-Wextra", "-Wpedantic", "-Wshadow-all", "-Wno-unused-parameter", file, arg]
print(json.dumps(j, indent=2))' > compile_commands.json
  # Pass through all other commands to ue4
	else
		$ue4cli "$@"
	fi
}

alias ue4='echo Please use ue instead.'
alias ue5='echo Please use ue instead.'

up() {
  local current_dir dirs full_path
  current_dir=$(pwd)

  IFS='/' dirs=(${(s:/:)current_dir})

  paths=()
  full_path=""
  for i in {1..${#dirs[@]}}; do
    if [ "$i" -ne 1 ]; then
      full_path="${full_path}${dirs[$i-1]}/"
    else
      full_path="/${dirs[$i-1]}"
    fi
    paths+=("$full_path")
  done

  selected_path=$(printf "%s\n" "${paths[@]}" | sort -rn | fzf)

  if [ -n "$selected_path" ]; then
    cd "$selected_path"
  fi
}
