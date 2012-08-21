_show_dirname_on_screen_title() {
  echo -ne "\ek$(basename $(pwd))\e\\"
}
precmd_functions+=_show_dirname_on_screen_title

function git_not_pushed() {
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
    head="$(git rev-parse HEAD 2>/dev/null)"
    for x in $(git rev-parse --remotes)
    do
      if [ "$head" = "$x" ]; then
        return 0
      fi
    done
    echo " %F{red}[not pushed]%f"
  fi
  return 0
}

function prompt_git_current_branch() {
    local name st color suffix gitdir action
    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
        return
    fi

    name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
    if [[ -z $name ]]; then
        return
    fi

    gitdir=`git rev-parse --git-dir 2> /dev/null`
    action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

    if [[ -e "$gitdir/prompt-nostatus" ]]; then
        echo "%F{cyan}git:%f$name$action"
        return
    fi

    st=`git status 2> /dev/null`
    if [[ "$st" =~ "(?m)^nothing to" ]]; then
        color="%F{green}"
    elif [[ "$st" =~ "(?m)^nothing added" ]]; then
        color="%F{yellow}"
    elif [[ "$st" =~ "(?m)^no changes added" ]]; then
        color="%F{red}"
    elif [[ "$st" =~ "(?m)^# Untracked" ]]; then
        color="%B%F{red}"
        suffix="%b"
    fi

    echo "%F{cyan}git:%f$color$name$action%f$suffix"
}
