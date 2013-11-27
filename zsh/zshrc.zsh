#### オプション ####
[[ $TERM = "eterm-color" ]] && TERM=xterm-256color
## 基本 ##
#Emacsモード
bindkey -e
#キーバインド
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
bindkey "\e[Z" reverse-menu-complete



# ディレクトリ移動
## cdで移動してもpushdと同じようにディレクトリスタックに追加する。
setopt auto_pushd
## カレントディレクトリ中に指定されたディレクトリが見つからなかった場合に
## 移動先を検索するリスト。
#cdpath=(~ ~/project)
## フック関数を入れる変数
typeset -ga chpwd_functions
typeset -ga precmd_functions
typeset -ga preexec_functions

## ヒストリファイルにコマンドラインだけではなく実行時刻と実行時間も保存する。
setopt extended_history
## 同じコマンドラインを連続で実行した場合はヒストリに登録しない。
setopt hist_ignore_dups
## スペースで始まるコマンドラインはヒストリに追加しない。
setopt hist_ignore_space
## すぐにヒストリファイルに追記する。
setopt inc_append_history
## zshプロセス間でヒストリを共有する。
setopt share_history
## C-sでのヒストリ検索が潰されてしまうため、出力停止・開始用にC-s/C-qを使わない。
setopt no_flow_control
stty stop undef


# プロンプト
## PROMPT内で変数展開・コマンド置換・算術演算を実行する。
setopt prompt_subst
## PROMPT内で「%」文字から始まる置換機能を有効にする。
setopt prompt_percent
## コピペしやすいようにコマンド実行後は右プロンプトを消す。
setopt transient_rprompt


#拡張globを有効に
setopt extended_glob
#ファイル名の展開時にディレクトリなら/を付加する
setopt mark_dirs
#pushdで重複させない
setopt pushd_ignore_dups
#補完リストを詰める
setopt list_packed
#重複した履歴は登録しない
setopt hist_ignore_all_dups
#スペースから始まる履歴を登録しない
setopt hist_ignore_space
#履歴を保存する時、既に同じコマンドがあったら古い方を削除する
setopt hist_save_nodups
#コマンドのスペルチェック
setopt correct
#勝手に/を消さない
setopt noautoremoveslash
#補完の度にbeep音を鳴らさない
setopt nolistbeep
#補完時にエイリアスを展開してチェックする
setopt complete_aliases
#補完をメニューにする
setopt auto_menu
#補完候補にファイルの種類も表示
setopt list_types

#色を簡単に指定するための関数
autoload -U colors
colors
#zmv(mvコマンドの拡張版？)をロードする
autoload -Uz zmv

#大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#補完メニューを矢印やらTABやらで選択できるようにする
zstyle ':completion:*:default' menu select=1
#URL貼り付け時にクオートする
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

#バージョン判定に使えるやつ
autoload -Uz is-at-least
autoload -Uz add-zsh-hook
#バージョン管理システムの状態をうまいこと表示してくれる関数
autoload -Uz vcs_info

## 以下の3つのメッセージをエクスポートする
#   $vcs_info_msg_0_ : 通常メッセージ用 (緑)
#   $vcs_info_msg_1_ : 警告メッセージ用 (黄色)
#   $vcs_info_msg_2_ : エラーメッセージ用 (赤)
zstyle ':vcs_info:*' max-exports 3
#git svn hgを有効に
zstyle ':vcs_info:*' enable git svn hg
# 標準のフォーマット(git 以外で使用)
# misc(%m) は通常は空文字列に置き換えられる
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b]' '%m' '<!%a>'
zstyle ':vcs_info:svn:*' branchformat '%b:r%r'
#addしてる/してない変更がある時に表示する文字列
zstyle ':vcs_info:*' stagedstr 'S'
zstyle ':vcs_info:*' unstagedstr '?'

if is-at-least 4.3.10; then
    # git 用のフォーマット
    # git のときはステージしているかどうかを表示
    zstyle ':vcs_info:git:*' formats '(%s)-[%b]' '%c%u %m'
    zstyle ':vcs_info:git:*' actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"    # %c で表示する文字列
    zstyle ':vcs_info:git:*' unstagedstr "-"  # %u で表示する文字列
fi


#補完を有効に
fpath=(
    $HOME/project/dotfiles/zsh/hub-zsh-completion
    $fpath
)
autoload -Uz compinit
compinit

#履歴
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000


#lsコマンドに色をつける
export CLICOLOR=true

#外部ファイルの読み込み
#source $DOTFILES/zsh/zaw/zaw.zsh
source $DOTFILES/zsh/hook.zsh
source $DOTFILES/zsh/prompt.zsh
source $DOTFILES/zsh/alias.zsh

[[ -e $HOME/.zshrc_local ]] && source $HOME/.zshrc_local
