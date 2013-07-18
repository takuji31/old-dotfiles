case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias E="emacsclient -t"

alias la="ls -la"
alias lf="ls -F"
alias ll="ls -l"
alias lh="ls -h"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias s=screen
#TODO tmuxのエイリアスもうちょい整理
alias tn="tmux -2 new-session"
alias ta="tmuxx.sh"
alias tv="tmux new-window vim "

alias vi="vim"
alias q="exit"
alias sudo="sudo "
alias zmv='noglob zmv -W'

#TODO gitのalias書く
alias gst="git status -sb && git --no-pager stash list"
alias gch='git cherry -v'
alias glgg='git logg'
alias glg='git logg | head'
function gcm() {
    git commit -m $*
}

#eval "$(hub alias -s 2>/dev/null)"
