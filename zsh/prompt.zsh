#PROMPT周りの設定
#TODO ROOTの時は色変える
PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
SPROMPT="%{${fg[red]}%}%r じゃね? [n,y,a,e]:%{${reset_color}%} "

function update_prompt() {
    PROMPT="%F{red}%n@%m%f %F{magenta}%~%f %F{yellow}%D{%y/%m/%d %H:%M:%S}%f $(check_git_changed) "$'\n'"%F{red}%#%f "

}


precmd_functions+=update_prompt
