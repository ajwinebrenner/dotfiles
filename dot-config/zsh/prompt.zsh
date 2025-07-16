autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{blue}%b'

precmd() {
  vcs_info
  if [[ -z ${vcs_info_msg_0_} ]]; then
    PROMPT='%B%F{magenta}%4~%f %(?:%F{green}:%F{red})%(!.❯❯.❯)%f%b '
  else
    # repo dir only shown if not in the path prompt already. n '/*' in PWD expansion equal to %<n>~ in prompt.
    local repo_prefix=$(r="$(git rev-parse --show-toplevel)"; [[ ${PWD%/*/*} == $r* ]] && print -n "${r##*/} ❯ ")
    local stash_count=$(c="$(git rev-list --walk-reflogs --ignore-missing --count refs/stash)"; [[ $c -gt 0 ]] && print -n "[$c]")      
    PROMPT="%B%F{magenta}${repo_prefix}%2~%f${vcs_info_msg_0_}${stash_count} %(?:%F{green}:%F{red})%(!.❯❯.❯)%f%b "
  fi
} 
