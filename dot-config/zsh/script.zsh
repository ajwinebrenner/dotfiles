#!/usr/bin/env zsh

spurge () {
  local remote="${1:-origin}"
  local branch="$(git rev-parse --abbrev-ref "$remote" | sed "s;${remote}/;;")"
  git switch "$branch" && git pull || return 1
  
  local common_branches=$(comm -12 <(git branch | sed "s; *;;g" | sort) <(git remote prune "$remote" | sed "s;^.*${remote}/;;g" | sort))

  local b
  for b in "${(@f)common_branches}"; do
    git branch -D "$b"
  done   
}

bd () {
  (($#<1)) && {
    echo "usage: $0 <parent-dir|number-of-dirs>" >&2
    return 1
  }

  local dir_count="${#${(ps:/:)${PWD}}}"
  local dest="./"

  # first, try to find dir with matching name (could be a number)
  local parents
  local i
  for i in {$dir_count..2}; do
    parents+=("$(echo $PWD | cut -d'/' -f$i)")
  done
  parents+=("/")

  local parent
  foreach parent ($parents); do
    dest+="../"

    if [[ "$1" == "$parent" ]]; then
      cd $dest
      return 0
    fi
  done

  # if integer, go up n times
  dest="./"
  if [[ "$1" == <-> ]]; then
    if [[ $1 -gt $dir_count ]]; then
      echo "bd: $1 is larger than current depth" >&2
      return 1
    fi

    for i in {1..$1}; do
      dest+="../"
    done

    cd $dest
    return 0
  fi

  echo "bd: no parent directory named '$1'" >&2
  return 1
}

_bd () {
  # get parents in reverse
  local dir_count="${#${(ps:/:)${PWD}}}"
  local i
  for i in {$dir_count..2}; do
    reply+=("`echo $PWD | cut -d'/' -f$i`")
  done
  reply+=("/")
}
compctl -V directories -K _bd bd
