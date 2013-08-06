colorscheme hybrid

set guifont=Ricty_Regular_For_Powerline:h14
set clipboard=autoselect,unnamed

let tlist_objc_settings='objc;P:protocols;i:interfaces;I:implementations;M:instance methods;C:implementation methods;Z:protocol methods'

" -------------------------------------------------------------------------------------
" clang_complete
" -------------------------------------------------------------------------------------
let g:clang_complete_getopts_ios_ignore_directories = ["^\.git", "\.xcodeproj", "\.xcworkspace"]
let g:clang_complete_getopts_ios_default_options = '-w -fblocks -fobjc-arc -D __IPHONE_OS_VERSION_MIN_REQUIRED=60000'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1
