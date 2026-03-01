# Set default machine icon if not set
if [ -z "$machine_icon" ]; then
  machine_icon=%m
fi

export PROMPT='%F{#C044FF}$machine_icon%f %(?:%F{magenta}:%F{#F935B0})%B%1~%f%b$vcs_info_msg_0_ '

# Git indicator in prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %F{#C044FF}(%b)%f'
zstyle ':vcs_info:*' enable git
