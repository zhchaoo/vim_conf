﻿"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions & init ------------------ {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MySys()
    if has("win32")
        return "win32"
    elseif has("mac")
        return "mac"
    elseif has("unix")
        return "unix"
    else
        return "other"
    endif
endfunction

function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced != 0
        cclose
    else
        if exists("g:my_quickfix_win_height")
            execute "copen ".g:my_quickfix_win_height
        else
            copen
        endif
    endif
endfunction

augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

"Set pathogen
if MySys() == "unix" || MySys() == "mac"
source ~/.vim/bundle/pathogen.vim/autoload/pathogen.vim
else
source $VIM\vim_conf\bundle\pathogen.vim\autoload\pathogen.vim
endif
call pathogen#infect()
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General ------------------ {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

set visualbell
set noerrorbells
set noro

"Set to auto read when a file is changed from the outside
set autoread

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Font
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme monocai-ag
"Enable syntax hl
syntax enable
syntax on
set lines=45
set columns=150
" set guifont
if MySys() == "mac"
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

"Hide UI
if has("gui_running")
    "au GUIEnter * simalt ~x " maxmium the window
"    set guioptions-=m       " hide the menu bar
"    set guioptions-=t       " hide the tool bar
    set guioptions-=L       " hide left scrollbar
    set guioptions-=r       " hide right scrollbar
    set guioptions-=B       " hide bottom scrollbar
"    set showtabline=0       " hide tab bar
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text option
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set incsearch
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto command ------------------ {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" special statusbar for special window
if has("autocmd")

autocmd FileType qf 
\ wincmd L
"\ | vertical-resize 150

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

endif
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => KeyMapping ------------------ {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast saving
noremap <leader>w :w!<cr>
"Remove the Windows ^M
noremap <leader>m :%s/\r//g<CR>
"Append ';' symbol to the end of line
noremap <leader>; :execute "normal! mqA;"<CR>:execute "normal! `q"<CR>
" Set Key Maps
noremap <leader>q :qa!<CR>
noremap <leader>Q :wqa!<CR>
noremap <leader>n :cn<CR>
noremap <leader>N :cp<CR>
"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
noremap <silent> <leader>M :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <bar>
            \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
            \endif<CR>

" TagList
noremap <leader>e :Tlist<CR>
" QuickFix
noremap <leader>r :call QFixToggle(1)<CR>
" NERDTreeToggle
noremap <leader>t :NERDTreeToggle<CR>
" FuzzyFinder
noremap <leader>ff :FufTaggedFile<CR>
noremap <leader>fd :FufFile<CR>
noremap <leader>fb :FufBuffer<CR>
noremap <leader>ft :FufBufferTag<CR>
noremap <leader>fa :FufTag<CR>
" Cscope
noremap <leader>cc :set cscopequickfix=s-,c-,d-,i-,t-,e-<CR>
noremap <leader>ca :set cscopequickfix=s+,c+,d+,i+,t+,e+<CR>
" sdcv
nnoremap <leader>s :!sdcv '<cword>'<CR>
" 2html
nnoremap <leader>h :runtime! syntax/2html.vim<CR>
" json pretty
nnoremap <leader>j :execute '%!python -m json.tool'<cr>

""""""""""""""""""""""""""""""
" => VIM
""""""""""""""""""""""""""""""
autocmd BufRead,BufNew *.vim map <buffer> <leader><space> :w!<cr>:source %<cr>
" autoload _vimrc 
if MySys() == "unix" || MySys() == "mac"
autocmd! BufWritePost .vimrc source % 
else
autocmd! BufWritePost _vimrc source % 
endif
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration ------------------ {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
let g:miniBufExplorerMoreThanOne=1
let g:miniBufExplMaxSize = 2
let g:miniBufExplModSelTarget = 1

"Set org-mode plugin
"autocmd! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
"autocmd BufEnter *.org call org#SetOrgFileType()
"let g:org_command_for_emacsclient='e:/emacs-23.4/bin/runemacs'

"Set Objective-C format
let filetype_m='objc'

"Set go-vim plugin
let g:go_fmt_autosave = 0
" }}}
