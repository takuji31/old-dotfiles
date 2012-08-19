case "${OSTYPE}" in
freebsd*)
    alias ls="ls -G -w"
    ;;
linux*|darwin*)
    alias ls="ls --color"
    ;;
esac

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
