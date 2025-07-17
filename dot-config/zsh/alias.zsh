alias ls='ls --color=auto'
alias la='ls --color=auto -A'
alias ll='ls --color=auto -lhA'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gdf='git diff --name-only'
alias gdm='git diff main...'
alias gdmf='git diff main... --name-only'

alias t='tree -aC -I .git'
alias cdf='dir=$(find . -type d | fzf); [[ -n $dir ]] && cd "$dir"'
