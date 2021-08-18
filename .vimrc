" vundle
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set nu
set showcmd
set laststatus=1
set magic
set cursorline
if $TERM !="linux"
   set mouse=a
endif
set go=
set showmatch
set matchtime=1
set nobackup
set ruler
set autoindent
set confirm
" realtyxxx add
set hls is

set tabstop=2
set shiftwidth=2
set smarttab
set nocompatible
set expandtab
set backspace=indent,eol,start

set wildmenu
set fo=cqrt
set laststatus=2
set textwidth=120
set colorcolumn=+1
set ww=<,>,h,l
set noeb visualbell
let mapleader = "\<space>"

filetype on
filetype plugin on
filetype indent on
syntax on
syntax enable

" encoding
set fencs=utf-8,usc-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" Molokai
"colorscheme molokai
"highlight NonText guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0

" some map
map <F5> :call CR()<CR>
func! CR()
    exec "w"
    exec "!g++ % -o %<"
    exec "! ./%<"
endfunc

map <F10> :call RG()<CR>
func! RG()
    exec "w"
    exec "!g++ -std=c++11 % -g -o %<"
    exec "! ./%<"
endfunc

"map <F9> :call ClangFormat()<CR>
"func! ClangFormat()
"    exec "w"
"    exec "!clang-format  -i  % "
"endfunc

map <f2> :call SetTitle()<CR>
func SetTitle()
let l = 0
let l = l + 1 | call setline(l,'/*')
let l = l + 1 | call setline(l,' @File name   : '.expand("%"))
let l = l + 1 | call setline(l,' @File name   : '.expand("%"))
let l = l + 1 | call setline(l,' @Author      : Realtyxxx')
let l = l + 1 | call setline(l,' @Created Time: '.strftime("%c"))
let l = l + 1 | call setline(l,' @TODO        :')
let l = l + 1 | call setline(l,'*/')
let l = l + 1 | call setline(l,'')
let l = l + 1 | call setline(l,'#include <cstdio>')
let l = l + 1 | call setline(l,'#include <cstring>')
let l = l + 1 | call setline(l,'#include <cstdlib>')
let l = l + 1 | call setline(l,'#include <iostream>')
let l = l + 1 | call setline(l,'#include <string>')
let l = l + 1 | call setline(l,'#include <algorithm>')
let l = l + 1 | call setline(l,'#include <vector>')
let l = l + 1 | call setline(l,'#include <queue>')
let l = l + 1 | call setline(l,'#include <set>')
let l = l + 1 | call setline(l,'#include <map>')
let l = l + 1 | call setline(l,'')
let l = l + 1 | call setline(l,'using namespace std;')
let l = l + 1 | call setline(l,'')
endfunc

map <F3> :call SetTitle2()<CR>
func SetTitle2()
let l = 0
let l = l + 1 | call setline(l,'/******************************')
let l = l + 1 | call setline(l,' *File name: '.expand("%"))
let l = l + 1 | call setline(l,' *Author: Realtyxxx')
let l = l + 1 | call setline(l,' *Created Time: '.strftime("%c"))
let l = l + 1 | call setline(l,' *TODO:')
let l = l + 1 | call setline(l,'******************************/')
let l = l + 1 | call setline(l,'')
let l = l + 1 | call setline(l,'#include <bits/stdc++.h>')
let l = l + 1 | call setline(l,'using namespace std;')
let l = l + 1 | call setline(l,'')
endfunc

nnoremap <Ctrl>w dB
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
noremap <leader>w :w<CR>
noremap <leader>q :q!<CR>
inoremap jj <esc>

noremap <leader>b :ls<CR>
noremap <leader>n :bn<CR>
noremap <leader>p :bp<CR>

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=40
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
nmap ff :NERDTreeToggle<CR>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F7> :TagbarToggle<CR>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
let g:ycm_server_python_interpreter='/usr/local/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'


"Plugin 'Chiel92/vim-autoformat'
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
noremap <F9> :Autoformat<CR>
let g:autoformat_verbosemode=1


"Plugin 'preservim/nerdcommenter'
"map <C-m> <leader>cc
"map <A-m> <leader>cu
"unmap <CR>
map cc <leader>c<space>
"切换所选行的注释状态。如果最上面的一行被注释，所有被选中的行都会被取消注释，反之亦然。
map cs <leader>cs
"用一个漂亮的块状格式的布局来注释所选的行。
map ca <leader>ca
"将注释定界符添加到行尾，并在它们之间进入插入模式。

"Plugin 'vim-scripts/DoxygenToolkit.vim'

"vim-cpp-enhanced-highlight
"Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1


"clipboard
set clipboard=unnamed
