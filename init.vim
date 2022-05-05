call plug#begin('~/.config/vim_plug/plugged')
    Plug 'honza/vim-snippets'
    Plug 'bfrg/vim-cpp-modern'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-python/python-syntax'
    Plug 'vim-scripts/ctags.vim'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'vim-airline/vim-airline'
    Plug 'scrooloose/nerdcommenter'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'sainnhe/gruvbox-material'
    Plug 'Yggdroot/indentLine'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'majutsushi/tagbar'
    Plug 'Chiel92/vim-autoformat'
    Plug 'buoto/gotests-vim'
    Plug 'fatih/vim-go', {'do':':GoUpdateBinaries'}
    Plug 'mhinz/vim-startify'
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    " Plug 'morhetz/gruvbox'
call plug#end()

"我自己的习惯设置
let mapleader=','
inoremap <silent> jj <Esc>`^
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :set fenc= <CR>:w!<CR>
noremap <leader>q :q!<CR>
noremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
noremap <leader>sv :source ~/.config/nvim/init.vim<CR>
noremap <leader>n :bn<CR>
noremap <leader>p :bp<CR>

inoremap {{      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
" inoremap ((      ()<Left>
" inoremap (<CR>  (<CR>)<Esc>O
" inoremap [[      []<Left>
" inoremap [<CR>  [<CR>]<Esc>O

nnoremap <C-s> :term<CR>


filetype plugin on
" 设置为双字宽显示(会影响界面渲染，所以关掉)
" set ambiwidth=double
" 防止vim背景颜色错误(现在没有这个问题)
" set t_ut=

" set viewoptions=cursor,folds,slash,unix
set splitbelow
set splitright
set virtualedit=block
set re=0
set tw=0
set list



" 高亮匹配括号
set showmatch
" 匹配括号显示时间
set matchtime=1
" 不占用最后的一个cmd框显示现在的模式
set noshowmode
" 取消警告声音
set novisualbell
set noerrorbells
set report=0
" 搜索不区分大小写
set ignorecase
set nobackup
set autoread
set nocompatible
set backspace=2 "能使用backspace回删
set showcmd
set hlsearch

syntax on "语法检测

" Tab settings
set ts=2
set softtabstop=2
set shiftwidth=2
set expandtab

" indent method
" set cindent
set smartindent

" Set Mouse
" set mouse=a
" set selection=exclusive
" set selectmode=mouse,key

set history=9000 "设置历史记录条数
" close welcome page
set shortmess=atI
set clipboard+=unnamed

" VIM Encoding Method
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,latin1
set termencoding=utf-8

set signcolumn=yes
set cmdheight=1
set ruler
set nu
set cursorline

" reset cursor when vim exits
" au VimLeave * set guicursor=a:ver25-blinkon0
set foldmethod=indent " 设置默认折叠方式为缩进
set foldlevelstart=99 " 每次打开文件时关闭折叠

" coc.nvim settings
set hidden
set nowritebackup
set updatetime=300
set shortmess+=c

" Line Settings
set wrap

" +================================ colorscheme =====================================+ "
set t_Co=256
set termguicolors
hi ExtraWhitespace ctermbg=red guibg=red
hi Todo ctermbg=red guibg=red
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_contrast_light='hard'
" let g:airline_theme = 'gruvbox_material'
" set background=dark
" let g:gruvbox_material_background = 'hard'
" colorscheme gruvbox-material

hi Normal ctermfg=252 ctermbg=none "背景透明
au FileType gitcommit,gitrebase let g:gutentags_enabled=0
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

colorscheme onehalflight
" colorscheme onehalfdark
let g:airline_theme='onehalfdark'
set background=light



let g:python_highlight_all = 1
" +================================ 可视化缩进 =====================================+ "

let g:indent_guides_enable_on_vim_startup = 0  " 默认关闭
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进
au FileType json let g:indentLine_setConceal = 0 " set default conceal for json

" +================================== NERDTree =======================================+ "
" autocmd vimenter * NERDTree  "自动开启Nerdtree
let NERDChristmasTree=1
let NERDTreeWinSize=50
let NERDTreeChDirMode=2
let g:NERDTreeWinSize = 35 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" 设置树的显示图标
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:Turquoise = "40E0D0"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = "FE405F"
let s:git_orange = "F54D27"
let s:gray = "808A87"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['o'] = s:gray " sets the color of o files to blue
let g:NERDTreeExtensionHighlightColor['h'] = s:blue " sets the color of h files to blue
let g:NERDTreeExtensionHighlightColor['hpp'] = s:blue " sets the color of h files to blue
let g:NERDTreeExtensionHighlightColor['c'] = s:green " sets the color of c files to blue
let g:NERDTreeExtensionHighlightColor['cpp'] = s:green " sets the color of cpp files to blue
let g:NERDTreeExtensionHighlightColor['cc'] = s:green " sets the color of cpp files to blue
let g:NERDTreeExtensionHighlightColor['c++'] = s:green
let g:NERDTreeGitStatusShowIgnore = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
	\ }

" +================================== 按键映射 =======================================+ "
" self key map:
" <leader>s : open key
" <leader>d : close key
" <leader>e : norm key
" quicky paste
noremap <leader>sp :set paste<CR>i
nnoremap <leader>dp :set nopaste<CR>
" fold method change
nnoremap <leader>sf :set foldmethod=manual<CR>
nnoremap <leader>df :set foldmethod=indent<CR>
" enable and disable mouse support
nnoremap <leader>sa :set mouse=a<CR>
nnoremap <leader>da :set mouse=<CR>
set mouse=a

" match and undo trailing
nnoremap <leader>st :match ExtraWhitespace /\s\+$/<CR>/\s\+$/<CR>
nnoremap <leader>dt :match<CR>:noh<CR>
" close highlight
nnoremap <leader>dh :noh<CR>

inoremap <M-h> <left>
inoremap <M-j> <down>
inoremap <M-k> <up>
inoremap <M-l> <right>

" swap
" vnoremap <C-C> <ESC>`.``gvp``P

" plug key map
nnoremap ff :NERDTreeToggle<CR>:NERDTreeRefreshRoot<CR> " nerdtree


" +================================== coc.nvim  ======================================+ "
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? \"\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? \"\<TAB>" :
"       \ coc#refresh()
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" let g:coc_snippet_next = '<tab>'
if $CONDA_PREFIX == ""
  let s:current_python_path=$CONDA_PYTHON_EXE
else
  let s:current_python_path=$CONDA_PREFIX.'/bin'
endif
call coc#config('python', {'pythonPath': s:current_python_path})

" +=================================== tagbar =======================================+ "
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_2/bin/ctags'
let g:tagbar_ctags_bin = 'ctags'                       "tagbar以来ctags插件
let g:tagbar_left = 0                                          "让tagbar在页面左侧显示，默认右边
let g:tagbar_width = 40                                     "设置tagbar的宽度为30列，默认40
let g:tagbar_autofocus = 1                                "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
let g:tagbar_sort = 0                                         "设置标签不排序，默认排序
nmap <F7> :TagbarToggle<CR>
" +================================== airline =======================================+ "
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" let g:airline_theme = 'distinguished'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab
nmap <leader>dq :bp<cr>:bd #<cr>
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = ''
" let g:airline_left_sep = ']'
" let g:airline_left_alt_sep = ')'
" let g:airline_right_sep = '['
" let g:airline_right_alt_sep = '('
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR"
" +=============================== NERD Commenter ====================================+ "
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
au FileType python let g:NERDSpaceDelims = 0

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1

map cc <leader>c<space>
"切换所选行的注释状态。如果最上面的一行被注释，所有被选中的行都会被取消注释，反之亦然。
map cs <leader>cs
"用一个漂亮的块状格式的布局来注释所选的行。
map ca <leader>cA
"将注释定界符添加到行尾，并在它们之间进入插入模式。

" some map
map <F5> :call CR()<CR>
func! CR()
    exec "w"
    exec "!clang++ -std=c++17 -Wall -Wextra -Wpedantic % -o %<.out"
    exec "!./%<.out"
endfunc
" -Wall -Wpedantic -Wextra
" Enable compiler warnings. Highly recommended. These don't really activate all warnings, but rather the most important ones that don't produce too much (false positive) noise.

" map <F10> :call RG()<CR>
" func! RG()
"     exec "w"
"     exec "!clang++ -std=c++17 % -g -o %<.out"
" endfunc


map <f2> :call SetTitle()<CR>
func SetTitle()
let l = 0
let l = l + 1 | call setline(l,'/*')
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

" Chiel92/vim-autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
noremap <F9> :Autoformat<CR>
let g:autoformat_verbosemode=1

"ccls
let g:ale_cpp_ccls_init_options = {
\   'cache': {
\       'directory': '/tmp/ccls-cache'
\   }
\ }




" vim-go
noremap <f10> :GoRun<CR>
let g:go_fmt_autosave = 1
let g:go_fmt_command = 'gofmt'
let g:go_autodetect_gopath = 1
" let g:go_bin_path = '$GOBIN'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" vim-instant_markdown
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"Uncomment to override defaults:
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1
"let g:instant_markdown_autoscroll = 0
let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
map <F6> :InstantMarkdownPreview<CR>




