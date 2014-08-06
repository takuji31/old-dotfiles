"自動コマンドの二重読み込み防止の為に現在の自動コマンドを消す
autocmd!

"バッファー名をscreenのタイトルに
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | silent! exe printf('!echo -n "\ek%%:t[%d]\e\\"', winnr("$")) | endif

"互換モード切る
set nocompatible
filetype off
filetype plugin indent off

"let g:neobundle_default_git_protocol="https"
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
"NeoBundleに必要なものたち
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {'build' : {
                    \'mac' : 'make -f make_mac.mak',
                    \'unix' : 'make -f make_unix.mak',
                \},
            \}
NeoBundle 'Shougo/unite.vim'


"NeoBundle
NeoBundle 'groenewege/vim-less'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
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
NeoBundle 'basyura/bitly.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/gist-vim'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'tokuhirom/unite-git'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'rking/ag.vim'
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'modsound/gips-vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle "y-uuki/unite-perl-module.vim"
NeoBundle "y-uuki/perl-local-lib-path.vim"
NeoBundle 'rizzatti/funcoo.vim'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'dgryski/vim-godef'
NeoBundle 'fatih/vim-go'
NeoBundle 'nsf/gocode', {'rtp': 'vim/'}

"colorscheme
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'

NeoBundle 'nginx.vim'
NeoBundle 'sudo.vim'
"NeoBundle 'taglist.vim'

filetype plugin indent on
syntax enable

"set shell=bash
NeoBundleCheck

"UTF-8の文脈依存の文字幅を全角に(という認識)
set ambiwidth=double

"256色有効
set t_Co=256
"色の設定
colorscheme hybrid
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
"set splitright

"エンコーディングの設定
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos,mac
set encoding=utf-8

"バックアップをとらない
set nobackup
set noswapfile

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
"noremap : ;

"括弧の補完
inoremap {{ {}<LEFT>
inoremap [[ []<LEFT>
inoremap (( ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>

"C-pで連続ペースト
vnoremap <silent> <C-p> "0p<CR>

" Perltidy
map ,p <Esc>:%! perltidy<CR>
vmap ,p <Esc>:'<,'>! perltidy<CR>

"JSONの整形
map <Leader>j !python -m json.tool<CR>
"Perl形式で書いたデーターをJSON化する
vnoremap ,j !perl -MJSON::PP -w -E 'binmode STDIN, ":utf8"; my @lines = <STDIN>; my $data = join "\n", @lines; say JSON::PP->new->utf8->canonical->pretty->encode(eval $data);'<CR>

"|区切りの行からrstのGrid Tableを作るやつ
vnoremap ,gt !rst_make_grid_table.pl<CR>

"オムニ補完の発動をC-Spaceに
imap <Nul> <C-x><C-o>

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
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

"パス名からいいようにパッケージ名作ってくれる関数、PerlのSnippetで使ってるよ
func! PerlPackageName()
  let path = substitute(expand("%:p"),"\\","/","g")
  let str  = substitute(path , '.*lib/\(.\+\)\.pm','\1', "")
  return substitute(str, "/", "::", "g")
endfunc

" .psgi,.tはperl
autocmd BufNewFile,BufRead *.psgi set filetype=perl
autocmd BufNewFile,BufRead *.t set filetype=perl

" CocoaPods
autocmd BufNewFile,BufRead Podfile,*.podspec set filetype=ruby

" NeoSnippetのスニペットではハードタブを使用する
autocmd FileType snippet setlocal noexpandtab

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


" ------------------------------------------------------
" unite.vim
" ------------------------------------------------------
nnoremap <silent> ,f  :<C-u>Unite -buffer-name=git-ls git<CR>
nnoremap <silent> ,d  :<C-u>Unite -buffer-name=file file_rec/async<CR>
nnoremap <silent> ,b  :<C-u>Unite -buffer-name=myunite buffer file_mru file/new directory/new<CR>
nnoremap <silent> ,n  :<C-u>UniteWithBufferDir -buffer-name=new file/new directory/new<CR>
nnoremap <silent> ,y  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,o  :<C-u>Unite -buffer-name=outline outline<CR>
nnoremap <silent> ,p  :<C-u>Unite -buffer-name=perldoc ref/perldoc<CR>
nnoremap <silent> ,s  :<C-u>Unite -buffer-name=source source<CR>
nnoremap <silent> ,h  :<C-u>Unite -buffer-name=help help<CR>
nnoremap <silent> ,i  :<C-u>Unite -buffer-name=neobundle neobundle/install:!<CR>
nnoremap <silent> ,l  :<C-u>Unite -buffer-name=lines line<CR>
nnoremap <silent> ,m  :<C-u>Unite -buffer-name=menu menu:shortcut<CR>
nnoremap <silent> ,v  :<C-u>Unite -buffer-name=mapping mapping<CR>
nnoremap <silent> ,;  :<C-u>Unite -buffer-name=commands command<CR>
nnoremap <silent> ,g  :<C-u>Unite -buffer-name=grep grep:.<CR>
nnoremap <silent> ,c  :<C-u>UniteWithBufferDir -buffer-name=file file<CR>

let g:unite_source_file_ignore_pattern = '\%(^\|/\)\.$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$\|\%(^\|/\)blib\%($\|/\)'
let g:unite_source_file_rec_ignore_pattern = '\%(^\|/\)\.$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$\|\%(^\|/\)blib\%($\|/\)\|\%(^\|/\)blib\%($\|/\)'
let g:unite_source_file_mru_ignore_pattern = '\~$\|\.\%(o|exe|dll|bak|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|^\%(\\\\\|/mnt/\|/media/\|/Volumes/\)\|\%(^\|/\)\%(b\|ext\)lib\%($\|/\)'


let g:unite_source_file_mru_limit = 200
let g:unite_source_file_rec_max_depth = 10
let g:unite_enable_start_insert = 1

if !exists("g:unite_source_menu_menus")
    let g:unite_source_menu_menus = {}
endif

let g:unite_source_menu_menus.shortcut = {
\   "description" : "shortcut"
\}

" ここに書かれた順番のまま出力される
let g:unite_source_menu_menus.shortcut.candidates = [
\   [ "vimrc", $HOME . "/project/dotfiles/vim/vimrc.vim" ],
\   [ "gvimrc", $HOME . "/project/dotfiles/vim/gvimrc.vim" ],
\   [ "Unite Beautiful Attack", "Unite -auto-preview colorscheme" ],
\]

function! g:unite_source_menu_menus.shortcut.map(key, value)
    let [word, value] = a:value

    if isdirectory(value)
        return {
\               "word" : "[directory] ".word,
\               "kind" : "directory",
\               "action__directory" : value
\           }
    elseif !empty(glob(value))
        return {
\               "word" : "[file] ".word,
\               "kind" : "file",
\               "default_action" : "tabdrop",
\               "action__path" : value,
\           }
    else
        return {
\               "word" : "[command] ".word,
\               "kind" : "command",
\               "action__command" : value
\           }
    endif
endfunction

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

" unite-grepのバックエンドをagに
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

" ------------------------------------------------------
" neocomplete
" ------------------------------------------------------
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
" Use camel case completion.
let g:neocomplete#enable_camel_case_complete = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" define snippets directory
let g:neosnippet#snippets_directory = "~/.vim/snippets/"
" Define dictionary.
let g:neocomplete#sources#dictionary#doctionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR> neocomplete#close_popup()."\<CR>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#smart_close_popup()."\<C-y>"
inoremap <expr><C-e> pumvisible() ? neocomplete#cancel_popup() : "\<End>"

noremap es :<C-u>NeoSnippetEdit<CR>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"ダイナミック補完要らないんだけど無効にする方法見つからなかったからとりあえずごまかす
let g:dbext_default_profile_mysql = "type=MYSQL:user=root:dbname=mysql"
let g:dbext_default_profile = "mysql"
"SQLComplete.vimが矢印キーで入力ぶっ壊すクソ仕様なのでマップしないようにする
let g:omni_sql_no_default_maps = 1

" -------------------------------------------------------------------------------------
" vimfiler
" -------------------------------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_split_action = "split"
let g:vimfiler_split_rule = "botright"
let g:vimfiler_safe_mode_by_default = 0

nnoremap ff :<C-u>VimFiler<CR>
nnoremap fe :<C-u>VimFilerExplorer<CR>

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
nnoremap <Leader>gc :<C-u>Gcommit -v<CR>
nnoremap <Leader>gC :<C-u>Git commit --amend -v<CR>
nnoremap <Leader>gb :<C-u>Gblame<CR>
nnoremap <leader>gp :<C-u>Git push
nnoremap <leader>gP :<C-u>Git pull

" -------------------------------------------------------------------------------------
" quickrun
" -------------------------------------------------------------------------------------
nnoremap <Leader>q :<C-u>QuickRun -args<Space>

" Markdownのfoldingを無効に
let g:vim_markdown_folding_disabled=1

"Quickrunの設定
let g:quickrun_config = {}
let g:quickrun_config.mkd = {
\ 'outputter': 'browser',
\ 'type' : 'markdown/pandoc',
\ 'cmdopt' : '-s',
\ }

" -------------------------------------------------------------------------------------
" switch.vim
" -------------------------------------------------------------------------------------
nnoremap - :Switch<cr>

" -------------------------------------------------------------------------------------
" vim-easymotion
" -------------------------------------------------------------------------------------
" http://blog.remora.cx/2012/08/vim-easymotion.html
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「;」 + 何かにマッピング
let g:EasyMotion_leader_key="m"
let g:EasyMotion_mapping_j = '<C-j>'
let g:EasyMotion_mapping_k = '<C-k>'

" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" -------------------------------------------------------------------------------------
" vim-smartchr
" -------------------------------------------------------------------------------------
inoremap <expr> = smartchr#one_of('=', ' = ', ' == ', ' === ')
inoremap <expr> , smartchr#one_of(',', ', ', ' => ')

" -------------------------------------------------------------------------------------
" ag.vim
" -------------------------------------------------------------------------------------
nnoremap <Leader>ag :<C-u>Ag<Space>

" -------------------------------------------------------------------------------------
" gitv
" -------------------------------------------------------------------------------------
function! s:gitv_get_current_hash()
    return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction
autocmd FileType git setlocal nofoldenable foldlevel=0
function! s:toggle_git_folding()
    if &filetype ==# 'git'
        setlocal foldenable!
    endif
endfunction
autocmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
    setlocal iskeyword+=/,-,.
    nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
    nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
    nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
    nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
    nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
    nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
endfunction

"set tags=tags
"let Tlist_Show_One_File = 1 "現在編集中のソースのタグしか表示しない
"let Tlist_Exit_OnlyWiindow = 1 "taglist が最後のウインドウなら vim を閉じる
"let Tlist_Enable_Fold_Column = 1 " 折り畳み
"map <silent> <leader>tl :TlistToggle<CR>

" -------------------------------------------------------------------------------------
" perl-local-lib-path.vim
" -------------------------------------------------------------------------------------
autocmd FileType perl PerlLocalLibPath

" -------------------------------------------------------------------------------------
" vimdiff
" -------------------------------------------------------------------------------------
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

" -------------------------------------------------------------------------------------
" TweetVim
" -------------------------------------------------------------------------------------
let g:tweetvim_tweet_per_page = 100
let g:tweetvim_open_buffer_cmd = 'split'
let g:tweetvim_display_icon = 1

" -------------------------------------------------------------------------------------
" calendar.vim
" -------------------------------------------------------------------------------------
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" -------------------------------------------------------------------------------------
" golang
" -------------------------------------------------------------------------------------
"au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 completeopt=menu,preview
"au FileType go compiler go

let g:quickrun_config['go'] = {
          \ 'command': 'go',
          \ 'exec': ['%c run %s']
          \ }

""" vim-go
let g:go_bin_path = expand("~/.go/bin")
"let g:go_disable_autoinstall = 1
let g:gocomplete#system_function = 'vimproc#system'

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gl :GoLint<CR>
