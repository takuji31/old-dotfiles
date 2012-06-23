#PROMPT周りの設定
#TODO ROOTの時は色変える
PROMPT2="%F{green}%_%%%f "
SPROMPT="%F{green}%r じゃね? [n,y,a,e]:%f "

function update_prompt() {
    PROMPT="%F{green}%n@%m%#%f "
    LANG=ja_JP.utf8 vcs_info
    if [[ -n "$vcs_info_msg_0_" ]];
    then
        VCS_MESSAGE=" $vcs_info_msg_0_$(git_not_pushed)"
    else
        VCS_MESSAGE=""
    fi
    RPROMPT="%F{cyan}[ %~%f$VCS_MESSAGE %F{cyan}]%f"

}


precmd_functions+=update_prompt
