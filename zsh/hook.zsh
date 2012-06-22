_show_dirname_on_screen_title() {
  echo -ne "\ek$(basename $(pwd))\e\\"
}

chpwd_functions+=_show_dirname_on_screen_title
