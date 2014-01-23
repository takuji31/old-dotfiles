#言語設定
export LANG="ja_JP.UTF-8"
export LANGUAGE="ja_JP.UTF-8:en_US.UTF-8:en_US:en_GB:en"

#DOTFILES
link=`ls -l ~/.zshrc | sed -e "s/^l.*-> //"`
export DOTFILES=$(cd $(dirname $link);cd ../;pwd)

typeset -U path
path=(
$HOME/local/$([[ -e $HOME/local/.xbuild-perl-version ]] && cat $HOME/local/.xbuild-perl-version)/bin(N-/)
$DOTFILES/git/bin(N-/)
$HOME/project/bin(N-/)
$HOME/perl5/bin(N-/)
$HOME/local/perl/bin(N-/)
$HOME/local/bin(N-/)
$HOME/bin(N-/)
"/Applications/Sublime Text.app/Contents/SharedSupport/bin"(N-/)
$HOME/Applications/MacVim.app/Contents/MacOS(N-/)
/Applications/MacVim.app/Contents/MacOS(N-/)
$HOME/homebrew/bin(N-/)
/usr/local/sbin(N-/)
/opt/local/bin(N-/)
/usr/local/bin(N-/)
/usr/sbin(N-/)
/usr/bin(N-/)
/bin(N-/)
$path
)
path=(
    $(which brew && brew --prefix ruby)/bin(N-/)
    $path
)
export GIT_BIN=`which git`
export EDITOR=vim

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

[[ -e $HOME/.zshenv_local ]] && source $HOME/.zshenv_local

export ANDROID_HOME='/Applications/Android\ Studio.app/sdk';
export _JAVA_OPTIONS='-Dfile.encoding=UTF-8 -Dgroovy.source.encoding=UTF-8'
