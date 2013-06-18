#PROMPT周りの設定
#TODO ROOTの時は色変える
PROMPT2="%F{green}%_%%%f "
SPROMPT="%F{red}%r じゃね? [n,y,a,e]:%f "
PROMPT="%F{green}%n@%m%#%f "

autoload -Uz VCS_INFO_get_data_git
VCS_INFO_get_data_git 2> /dev/null

function _update_vcs_info_msg() {
    local -a messages
    local prompt

    LANG=en_US.UTF-8 vcs_info

    messages+=("%F{cyan}%~%f")
    if [[ -n ${vcs_info_msg_0_} ]]; then
        # vcs_info で情報を取得した場合
        # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ を
        # それぞれ緑、黄色、赤で表示する
        [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
        [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
        [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )

    fi

    # 間にスペースを入れて連結する
    RPROMPT="${(j: :)messages}"
}
add-zsh-hook precmd _update_vcs_info_msg
