"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MySys()
if has("win32")
return "win32"
elseif has("unix")
return "unix"
else
return "mac"
endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable filetype plugin
filetype on
filetype plugin on
filetype indent on
 
"Set to auto read when a file is changed from the outside
set autoread

"Set mapleader
let mapleader = ","
let g:mapleader = ","
 
"Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Font
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desert 
"Enable syntax hl
syntax enable
syntax on
set lines=45
set columns=150
" set guifont
if MySys() == "unix" || MySys() == "mac"
set guifont=Menlo:h14
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fileformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetype
set ffs=unix,dos,mac
"Set encoding
"set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"Show line number
set nu


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text option
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=4
set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => KeyMapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Key Maps
map <F4> :Tlist<CR>
map <S-F5> :NERDTreeToggle<CR>
map <S-F11> :wqa!<CR>
map <F11> :qa!<CR>
map <F10> :cn<CR>
map <S-F10> :cp<CR>

""""""""""""""""""""""""""""""
" => VIM
""""""""""""""""""""""""""""""
au BufRead,BufNew *.vim map <buffer> <leader><space> :w!<cr>:source %<cr>
" autoload _vimrc 
if MySys() == "unix" || MySys() == "mac"
autocmd! BufWritePost .vimrc source % 
else
autocmd! BufWritePost _vimrc source % 
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M
noremap <Leader>m :%s/\r//g<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set pathogen
if MySys() == "unix" || MySys() == "mac"
source ~/.vim/bundle/pathogen.vim/plugin/pathogen.vim
else
source $VIM\vimfiles\bundle\pathogen.vim\plugin\pathogen.vim
endif
call pathogen#infect()

"Set Ctags.
set tags=tags,../tags

"Set Cscope.
set cscopequickfix=s-,c-,d-,i-,t-,e-

"Set TagList.
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Open=0
let Tlist_GainFocus_On_ToggleOpen=1
" Set TagList For Objective-c
let tlist_objc_settings='objc;i:interface;c:class;m:method;p:property'
let Tlist_Close_On_Select=1

"Set MiniBuf.
let g:miniBufExplorerMoreThanOne=0

"Set org-mode plugin
"au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
"au BufEnter *.org call org#SetOrgFileType()
"let g:org_command_for_emacsclient='e:/emacs-23.4/bin/runemacs'

"Set Objective-C format
let filetype_m='objc'

