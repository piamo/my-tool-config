" ------------------------------------------------------ vundle plugin -----------------------------------------------------
set shell=bash\ -l
set nocompatible              " be improved
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" ctrp.vim
Plugin 'ctrlpvim/ctrlp.vim'
" directory tree
Plugin 'scrooloose/nerdtree'
" nerdtree tabs
Plugin 'jistr/vim-nerdtree-tabs'
" git change
Plugin 'Xuyuanp/nerdtree-git-plugin'
" nginx syntax
Plugin 'evanmiller/nginx-vim-syntax'
" vim ruby
Plugin 'vim-ruby/vim-ruby'
" auto-add 'end' after if/def/begin/class/module
Plugin 'tpope/vim-endwise'
" auto-complete plugin
Plugin 'Valloric/YouCompleteMe'
" auto-closing quotes, parenthesis, brackets, etc.
Plugin 'Raimondi/delimitMate'
" vim git diff
Plugin 'airblade/vim-gitgutter'
" run git cmd in vim
Plugin 'tpope/vim-fugitive'
" vim shell
" Plugin 'vim-scripts/Conque-Shell'
Plugin 'jewes/Conque-Shell'
" vim colorscheme: solarized
Plugin 'altercation/vim-colors-solarized'
" syntax checker
Plugin 'scrooloose/syntastic'
" white space highlight
Plugin 'ntpeters/vim-better-whitespace'
" scala support
Plugin 'derekwyatt/vim-scala'
" groovy support
Plugin 'vim-scripts/groovy.vim'
" markdown syntax support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" markdown preview
Plugin 'suan/vim-instant-markdown'
" asynchronous grep
Plugin 'ramele/agrep'
" vim rails support
Plugin 'tpope/vim-rails'
" vim bundler support
Plugin 'tpope/vim-bundler'
" vim rake support
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-projectionist'
" snipmate
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" ruby block select
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
" go plugin
Plugin 'fatih/vim-go'
" python ide
Plugin 'klen/python-mode'
" C++ 11/14
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'

runtime macros/matchit.vim

" required, plugins avaliable after
call vundle#end()

" --------------------------------------------------------------------------------------------------------------------------

"打开语法高亮
syntax on

"传说中的去掉边框用下边这一句
set go=
"显示行号
set number
"显示相对行号
"set relativenumber
"设置缩进有三个取值cindent(c风格)、smartindent(智能模式，其实不觉得有什么智能)、autoindent(简单的与上一行保持一致)
set cindent
"在windows版本中vim的退格键模式默认与vi兼容，与我们的使用习惯不太符合，下边这条可以改过来
set backspace=indent,eol,start
""用空格键替换制表符
"set expandtab
""制表符占2个空格
"set tabstop=2
""默认缩进2个空格大小
"set shiftwidth=2
"增量式搜索
set incsearch
"高亮搜索
set hlsearch
"代码匹配
set showmatch
"总是显示状态栏
set laststatus=2
"光标所在行加下划线
set cursorline
"光标所在列加下划线
set cursorcolumn
"vim之外修改自动读入
set autoread
"有时中文会显示乱码，用一下几条命令解决
let &termencoding=&encoding
set fileencodings=utf-8,gbk
"搜索忽略大小写
set ignorecase
" 禁止折行
set nowrap

" 设置<leader>键
let mapleader=';'
" 将当前工作路径设为Vim PATH
set path=$PWD/**
" vim 自身命令行模式智能补全
set wildmenu wildmode=full
set wildchar=<Tab> wildcharm=<C-Z>

noremap <c-n> :b <c-z>
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y
nmap <leader>m %

" if not set, something wrong in vim
let g:solarized_termtrans = 1
if has('gui_running')
  set background=light
else
  set background=dark
  let g:solarized_termcolors=256
endif
"设置背景色，每种配色有两种方案，一个light、一个dark
"set background=dark
"设置配色，这里选择的是solarized，也有其他方案，在vim中输入:color 在敲tab键可以查看
colorscheme solarized

" vim markdown config
let g:vim_markdown_folding_disabled = 1


"配置标签页,ctrl h/l切换标签
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>v :tabe<CR>

" 鼠标切换窗口
set mouse=a
"很多插件都会要求的配置检测文件类型
filetype on
filetype plugin on
filetype indent on

"下边这个很有用可以根据不同的文件类型执行不同的命令
"例如：如果是c/c++类型
":autocmd FileType c,cpp : set foldmethod=syntax
autocmd FileType c,cpp :set cindent

"例如：如果是python类型
":autocmd FileType python : set foldmethod=syntax
":autocmd FileType python :set smartindent
autocmd FileType python :set expandtab tabstop=4 shiftwidth=4

" go
autocmd FileType go :set smartindent

" ruby
" 空格代替tab; tab占2个space; 默认缩进2个space
autocmd FileType ruby :set expandtab tabstop=2 shiftwidth=2


set guioptions+=m "menu bar
set guioptions+=T "toolbar
set guioptions+=r "scrollbar

"" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" set working directory
let g:ctrlp_working_path_mode = 'ra'
" customize root flags
let g:ctrlp_root_markers = ['Gemfile.lock']
" ignore pattern
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" custom listing command
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

" NERD tree configuration
" if only directory tree, close vim
autocmd vimenter * if !argc() | NERDTree | endif
" \n open directory tree
map <leader>t <plug>NERDTreeTabsToggle<CR>
map <F5> :NERDTreeToggle<cr>
let NERDTreeShowLineNumber=1
let NERDTreeAutoCenter=1
" show hidden files
let NERDTreeShowHidden=1
"let g:nerdtree_tabs_open_on_console_startup=1
" ignore file patterns
let NERDTreeIgnore=['\.pyc', '\~$', '\.swp']
" show bookmarks
let NERDTreeShowBookmarks=1
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

" ruby compiler
autocmd FileType ruby compiler ruby

" config youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_highlighting = 0
""highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

" vim powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" set gvim font which can show powerline symbol
" PS: vim font always follow terminal, can't be changed
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" no auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" config plugin 'Syntastic'
" 每次自动调用 :SyntasticSetLocList, 将错误覆盖 **quickfix**
let g:syntastic_always_populate_loc_list = 1
" 设置错误符号
let g:syntastic_error_symbol='✗'
" 设置警告符号
let g:syntastic_warning_symbol='⚠'
" 是否在打开文件时检查
let g:syntastic_check_on_open=1
" 是否在保存文件后检查
let g:syntastic_check_on_wq=1
" short key
nnoremap <leader>e :Errors<CR>
nnoremap <leader>c :lclose<CR>
nnoremap <leader>n :lnext<CR>
nnoremap <leader>p :lprev<CR>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-Z> :ZoomToggle<CR>

" Jenkinsfile as groovy syntax
au BufReadPost Jenkinsfile set syntax=groovy
au BufReadPost Jenkinsfile set filetype=groovy

" snipmate
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'"
" insert mode
imap yy <esc>a<Plug>snipMateNextOrTrigger
" smap ss <Plug>snipMateNextOrTrigger


""""""""""""""""""""""
    "Quickly Run
""""""""""""""""""""""
map <F4> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'ruby'
        exec "!time ruby %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

let g:pymode_python = 'python3'

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1

" nathanaelkane/vim-indent-guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
