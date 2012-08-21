#言語設定
export LANG="ja_JP.UTF-8"
export LANGUAGE="ja_JP.UTF-8:en_US.UTF-8:en_US:en_GB:en"

#DOTFILES
link=`ls -l ~/.zshrc | sed -e "s/^l.*-> //"`
export DOTFILES=$(cd $(dirname $link);cd ../;pwd)

typeset -U path
path=(
$(which brew && brew --prefix coreutils)/libexec/gnubin(N-/)
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
export EMAIL=takuji@senchan.jp

#MySQLのプロンプト
export MYSQL_PS1='\U DB:\d DATE: \D MySQL: \v  \n>\_'


export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

#perlbrew
[[ -s $HOME/perl5/perlbrew/etc/bashrc ]] && source $HOME/perl5/perlbrew/etc/bashrc

if [[ -s /usr/local/perlbrew/bashrc ]];
then
    source /usr/local/perlbrew/bashrc
fi

#PERL5LIBに./libをねじ込む
typeset -xT PERL5LIB perl5_lib
typeset -U perl5_lib
perl5_lib=(
    ./lib
    $perl5_lib
)

if [ -e "$(which rbenv)" ]; then
    eval "$(rbenv init -)"
fi

