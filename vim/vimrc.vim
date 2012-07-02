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
NeoBundle 'c9s/perlomni.vim'
NeoBundle 'takuji31/xslate-vim'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'othree/eregex.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'thinca/vim-quickrun'

filetype plugin indent on
syntax enable

"UTF-8の文脈依存の文字幅を全角に(という認識)
set ambiwidth=double

"256色有効
set t_Co=256
"色の設定
colorscheme wombat256patched
"backspaceで消せる文字の設定
set backspace=eol,indent,start
"C言語タイプのインデントをオン
set cindent
"タブをソフトタブで入力
set expandtab
"インクリメントサーチを有効に
set incsearch
"Listモード有効
set list
"Listモードの文字
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
"対応するカッコを表示
set showmatch
"この2つで小文字ならスマートケース、大文字なら通常検索に設定
set ignorecase
set smartcase
"自動インデントに使われるスペース数
set shiftwidth=4
"タブの表示文字数
set tabstop=4
"splitによる分割を右半分にする
set splitright

"エンコーディングの設定
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos,mac
set encoding=utf-8

"バックアップをとらない
set nobackup

"ステータスラインを表示
set laststatus=2

"上下の物理行移動と論理行移動を入れ替えます
noremap j gj
noremap k gk
noremap gj j
noremap gk k

"検索中の/?をエスケープ
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

"検索結果の移動をした時に結果を真ん中にもってくる
nnoremap n  nzz
nnoremap N  Nzz

"最後に編集したテキストを選択
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

"Ctrl-Aで最初に、Ctrl-Eは後で設定してる
inoremap <C-A>  <Home>
"ノーマルモードでCtrl-A/E
noremap <C-E> <END>
noremap <C-A> <Home>

";と:を入れ替え
noremap ; :

" Perltidy
map ,pt <Esc>:%! perltidy<CR>
map ,ptv <Esc>:'<,'>! perltidy<CR>

"%のカッコ移動を拡張
source $VIMRUNTIME/macros/matchit.vim

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"ESC2回押しで検索のハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"パス名からいいようにパッケージ名作ってくれる関数、PerlのSnippetで使ってるよ
func! PerlPackageName()
  let path = substitute(expand("%:p"),"\\","/","g")
  let str  = substitute(path , '.*lib/\(.\+\)\.pm','\1', "")
  return substitute(str, "/", "::", "g")
endfunc

"zencoding.vim
let g:user_zen_settings = {
            \    'indentation' : '    ',
            \    'lang' : 'ja',
            \    'php' : {
            \        'extends' : 'html',
            \    },
            \    'tt2html' : {
            \        'extends' : 'html',
            \    },
            \    'tmt2html' : {
            \        'extends' : 'html',
            \    },
            \}


"unite.vim
noremap [unite]  <Nop>
map     f        [unite]
nnoremap <silent> [unite]d  :<C-u>Unite -buffer-name=files file_mru file_rec<CR>
nnoremap <silent> [unite]t  :<C-u>Unite -buffer-name=tabs tab buffer file_mru<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite -buffer-name=files outline buffer_tab file_mru<CR>
nnoremap <silent> [unite]p  :<C-u>Unite -buffer-name=perldoc ref/perldoc<CR>
nnoremap <silent> [unite]s  :<C-u>Unite -buffer-name=source source<CR>
nnoremap <silent> [unite]h  :<C-u>Unite -buffer-name=help help<CR>

let g:unite_source_file_ignore_pattern = '\%(^\|/\)\.$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$\|\%(^\|/\)blib\%($\|/\)'
let g:unite_source_file_rec_ignore_pattern = '\%(^\|/\)\.$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$\|\%(^\|/\)blib\%($\|/\)\|\%(^\|/\)blib\%($\|/\)'
let g:unite_source_file_mru_ignore_pattern = '\~$\|\.\%(o|exe|dll|bak|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|^\%(\\\\\|/mnt/\|/media/\|/Volumes/\)\|\%(^\|/\)blib\%($\|/\)'


let g:unite_source_file_mru_limit = 200
let g:unite_source_file_rec_max_depth = 10
let g:unite_enable_start_insert = 1

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
" タブで開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-b> unite#do_action('tabopen')
au FileType unite inoremap <silent> <buffer> <expr> <C-b> unite#do_action('tabopen')

"更に下のディレクトリーをたどる
au FileType unite inoremap <silent> <buffer> <expr> <C-r> unite#do_action('rec')

" ------------------------------------------------------
" neocomplcache
" ------------------------------------------------------
" enable neocomplcache
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" define snippets directory
let g:neocomplcache_snippets_dir = "~/.vim/snippets/"
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
    
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> pumvisible() ? "\<C-n>" : neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#smart_close_popup()."\<C-y>"
inoremap <expr><C-e> pumvisible() ? neocomplcache#cancel_popup() : "\<End>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"ダイナミック補完要らないんだけど無効にする方法見つからなかったからとりあえずごまかす
let g:dbext_default_profile_mysql = "type=MYSQL:user=root:dbname=mysql"
let g:dbext_default_profile = "mysql"
"SQLComplete.vimが矢印キーで入力ぶっ壊すクソ仕様なのでマップしないようにする
let g:omni_sql_no_default_maps = 1

" -------------------------------------------------------------------------------------
" vimfiler
" -------------------------------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_split_rule = "botright"
let g:vimfiler_safe_mode_by_default = 0

nnoremap ff :<C-u>VimFilerSplit<CR>
nnoremap fe :<C-u>VimFiler<CR>

"vim-powerline
let g:Powerline_symbols = 'fancy'

" -------------------------------------------------------------------------------------
" NERD_commenter
" -------------------------------------------------------------------------------------
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

nmap <Leader>cc <Plug>NERDCommenterAlignLeft
vmap <Leader>c  <Plug>NERDCommenterComment
nmap <Leader>C  <Plug>NERDCommenterToEOL
vmap <Leader>C  <Plug>NERDCommenterAlignLeft

nmap <Leader>u  <Plug>NERDCommenterUncomment
vmap <Leader>u  <Plug>NERDCommenterUncomment

nmap <Leader>xm <Plug>NERDCommenterMinimal
nmap <Leader>xs <Plug>NERDCommenterSexy
vmap <Leader>xm <Plug>NERDCommenterMinimal
vmap <Leader>xs <Plug>NERDCommenterSexy
nmap <Leader>xa <Plug>NERDCommenterAltDelims

" -------------------------------------------------------------------------------------
" fugitive
" -------------------------------------------------------------------------------------
nnoremap <Leader>g<Space> :<C-u>Git<Space>
nnoremap <Leader>gg :<C-u>Ggrep<Space>
nnoremap <Leader>gd :<C-u>Gdiff<CR>
nnoremap <Leader>gs :<C-u>Gstatus<CR>
nnoremap <Leader>gl :<C-u>Glog<CR>
nnoremap <Leader>ga :<C-u>Gwrite<CR>
nnoremap <Leader>gw :<C-u>Gwq<CR>
nnoremap <Leader>gw! :<C-u>Gwq!<CR>
nnoremap <Leader>gc :<C-u>Gcommit<CR>
nnoremap <Leader>gC :<C-u>Git commit --amend<CR>
nnoremap <Leader>gb :<C-u>Gblame<CR>
nnoremap <leader>gp :<C-u>Git push
nnoremap <leader>gP :<C-u>Git pull

