LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
setopt globdots

HISTFILE="$ZDOTDIR/.zhistory"
HISTSIZE="50000"
SAVEHIST="10000"
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify

bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
