_show_dirname_on_screen_title() {
  echo -ne "\ek$(basename $(pwd))\e\\"
}

function git_not_pushed() {
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
    head="$(git rev-parse HEAD)"
    for x in $(git rev-parse --remotes)
    do
      if [ "$head" = "$x" ]; then
        return 0
      fi
    done
    echo " ↑"
  fi
  return 0
}
chpwd_functions+=_show_dirname_on_screen_title
