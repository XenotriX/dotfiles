# Aliases
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
alias wk='nvim +"Obsidian quick_switch"'
alias gpt='sgpt --repl temp'
alias tgpt='sgpt --role transform'
