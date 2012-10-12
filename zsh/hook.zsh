_show_dirname_on_screen_title() {
  echo -ne "\ek$(basename "$(pwd)")\e\\"
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
    st=`git status 2>/dev/null`
    if [[ $st =~ "(?m)^# Your branch is ahead of" ]];then
        echo " %F{yellow}[not pushed]%f"
    elif [[ $st =~ "(?m)^# Your branch is behind" ]];then
        echo " %F{yellow}[not pulled]%f"
    elif [[ $st =~ "have diverged" ]];then
        echo " %F{red}[have diverged]%f"
    else
        echo " %F{yellow}[unknown]%f"
    fi
  fi
  return 0
}

function prompt_git_current_branch() {
    local name gst st gitdir action
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

    gst=`git status -s 2> /dev/null`
    if [[ "$gst" =~ "(?m)^M" ]]; then
        st="%F{green}M%f"
    fi
    if [[ "$gst" =~ "(?m)^(?:A|D|R|C)" ]]; then
        st="$st%F{green}S%f"
    fi
    if [[ "$gst" =~ "(?m)^[\s\w]M" ]]; then
        st="$st%F{red}M%f"
    fi
    if [[ "$gst" =~ "(?m)^[\s\w](?:\?|A|D|R|C)" ]]; then
        st="$st%F{red}S%f"
    fi

    if [[ -z "$st" ]]; then
        st="%F{green}no change%f"
    fi

    echo "%F{cyan}git:%f%F{yellow}$name%f$action ST:($st)"
}
