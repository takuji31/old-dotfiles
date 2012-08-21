#PROMPT周りの設定
#TODO ROOTの時は色変える
PROMPT2="%F{green}%_%%%f "
SPROMPT="%F{green}%r じゃね? [n,y,a,e]:%f "

autoload -Uz VCS_INFO_get_data_git
VCS_INFO_get_data_git 2> /dev/null

function update_prompt() {
    LANG=ja_JP.utf8 vcs_info
    VCS_MESSAGE="$vcs_info_msg_0_$(prompt_git_current_branch)$(git_not_pushed)"
    if [[ -n "$VCS_MESSAGE" ]];
    then
        VCS_MESSAGE="%F{cyan}(%f$VCS_MESSAGE%F{cyan})%f"
    fi

    PROMPT="%F{cyan}%n@%m%f %F{blue}%~ %f$VCS_MESSAGE
%F{green}%#%f "
}

precmd_functions+=update_prompt
