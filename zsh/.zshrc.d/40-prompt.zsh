# Set default machine icon if not set
if [ -z "$machine_icon" ]; then
  machine_icon=%m
fi

# Set default machine color if not set
if [ -z "$machine_color" ]; then
    machine_color="#5BAAD4"
fi

local _p_host='%K{#0f0f0f}%F{$machine_color} $machine_icon %f%k%F{#0f0f0f}%f'
local _p_dir='%(?:%F{magenta}:%F{#F935B0})%B%1~%f%b'

export PROMPT="${_p_host}${_p_dir}"'$vcs_info_msg_0_ '

# Git indicator in prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %F{#C044FF}(%b)%f'
zstyle ':vcs_info:*' enable git
