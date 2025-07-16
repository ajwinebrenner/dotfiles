source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/behave.zsh"
source "$ZDOTDIR/prompt.zsh"
source "$ZDOTDIR/script.zsh"
autoload -Uz compinit; compinit

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="hx"
fi

export PATH="$PATH:~/go/bin"
