#言語設定
export LANG="ja_JP.UTF-8"
export LANGUAGE="ja_JP.UTF-8:en_US.UTF-8:en_US:en_GB:en"

#DOTFILES
link=`ls -l ~/.zshrc | sed -e "s/^l.*-> //"`
export DOTFILES=$(cd $(dirname $link);cd ../;pwd)

typeset -U path
path=(
$(which brew && brew --prefix ruby)/bin(N-/)
$DOTFILES/git/bin(N-/)
$HOME/project/bin(N-/)
$HOME/perl5/bin(N-/)
$HOME/local/bin(N-/)
$HOME/bin(N-/)
/Applications/MacVim.app/Contents/MacOS(N-/)
/usr/local/sbin(N-/)
/opt/local/bin(N-/)
/usr/local/bin(N-/)
$path
)

export GIT_BIN=`which git`
#EDITORの設定、自分で入れたvimがあればそれを使う
if test -e /usr/local/bin/vim
then
    export EDITOR=/usr/local/bin/vim
else
    export EDITOR=vim
fi

#sudo
# -x: export SUDO_PATHも一緒に行う。
# -T: SUDO_PATHとsudo_pathを連動する。
typeset -xT SUDO_PATH sudo_path
# 重複したパスを登録しない。
typeset -U sudo_path
# (N-/): 存在しないディレクトリは登録しない。
#    パス(...): ...という条件にマッチするパスのみ残す。
#            N: NULL_GLOBオプションを設定。
#               globがマッチしなかったり存在しないパスを無視する。
#            -: シンボリックリンク先のパスを評価。
#            /: ディレクトリのみ残す。
sudo_path=({/usr/local,/usr}/sbin(N-/))

#Ruby
typeset -xT RUBYLIB ruby_path
typeset -U ruby_path
ruby_path=(
    ./lib
)

#Python
typeset -xT PYTHONPATH pyhon_path
typeset -U python_path
python_path=(
    ./lib
    /usr/local/lib/python2.7/site-packages(N-/)
)

#Pager
if type lv > /dev/null 2>&1; then
    export PAGER="lv"
else
    export PAGER="less"
fi


#lvの設定
if [ "$PAGER" = "lv" ]; then
    ## -c: ANSIエスケープシーケンスの色付けなどを有効にする。
    ## -l: 1行が長くと折り返されていても1行として扱う。
    ##     （コピーしたときに余計な改行を入れない。）
    export LV="-c -l"
fi

#Email
export EMAIL=takuji31@gmail.com

#MySQLのプロンプト
export MYSQL_PS1='\U DB:\d DATE: \D MySQL: \v  \n>\_'


export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which plenv > /dev/null; then eval "$(plenv init -)"; fi

[[ -e $HOME/.zshenv_local ]] && source $HOME/.zshenv_local

export ANDROID_HOME='/Applications/Android\ Studio.app/sdk';
export _JAVA_OPTIONS='-Dfile.encoding=UTF-8 -Dgroovy.source.encoding=UTF-8'
