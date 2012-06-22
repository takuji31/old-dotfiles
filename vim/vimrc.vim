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

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
