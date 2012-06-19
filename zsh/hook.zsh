#vcs_infoだと変更あった時にしか文字表示出来ないから関数でチェックするの
function check_git_changed() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "*"
  else
    echo "✓"
  fi
}
