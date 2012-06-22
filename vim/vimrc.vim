"自動コマンドの二重読み込み防止の為に現在の自動コマンドを消す
autocmd!

"バッファー名をscreenのタイトルに
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | silent! exe printf('!echo -n "\ek%%:t[%d]\e\\"', winnr("$")) | endif

"互換モード切る
set nocompatible
filetype off
filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

"NeoBundleに必要なものたち
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'


"NeoBundle
NeoBundle 'groenewege/vim-less'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'sgur/unite-git_grep'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'takuji31/perlomni.vim'
NeoBundle 'takuji31/xslate-vim'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-jp/vimdoc-ja'

