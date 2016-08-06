" ------------------------------------------------------ vundle plugin -----------------------------------------------------
set nocompatible              " be improved
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" directory tree
Plugin 'scrooloose/nerdtree'
" nerdtree tabs
Plugin 'jistr/vim-nerdtree-tabs'
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
" vim status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" vim shell
" Plugin 'vim-scripts/Conque-Shell'
Plugin 'jewes/Conque-Shell'
" Generate a fast shell prompt with powerline symbols and airline colors
Plugin 'edkolev/promptline.vim'

" required, plugins avaliable after
call vundle#end()

" --------------------------------------------------------------------------------------------------------------------------

"打开语法高亮 
syntax on 

"传说中的去掉边框用下边这一句 
set go= 
"设置背景色，每种配色有两种方案，一个light、一个dark 
set background=light 
"显示行号 
set number 
"显示相对行号
"set relativenumber
"设置缩进有三个取值cindent(c风格)、smartindent(智能模式，其实不觉得有什么智能)、autoindent(简单的与上一行保持一致) 
set cindent 
"在windows版本中vim的退格键模式默认与vi兼容，与我们的使用习惯不太符合，下边这条可以改过来 
set backspace=indent,eol,start 
"用空格键替换制表符 
set expandtab 
"制表符占2个空格 
set tabstop=2 
"默认缩进2个空格大小 
set shiftwidth=2 
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
"vim之外修改自动读入
set autoread
"有时中文会显示乱码，用一下几条命令解决 
let &termencoding=&encoding 
set fileencodings=utf-8,gbk 
"搜索忽略大小写
set ignorecase

"设置配色，这里选择的是desert，也有其他方案，在vim中输入:color 在敲tab键可以查看 
colorscheme koehler

"配置标签页,ctrl h/l切换标签
let mapleader= ','
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <leader>t : tabe<CR>

" 鼠标切换窗口
set mouse=a
"很多插件都会要求的配置检测文件类型 
:filetype on 
:filetype plugin on 
:filetype indent on 
"下边这个很有用可以根据不同的文件类型执行不同的命令 
"例如：如果是c/c++类型 
":autocmd FileType c,cpp : set foldmethod=syntax 
:autocmd FileType c,cpp :set number 
:autocmd FileType c,cpp :set cindent 
"例如：如果是python类型 
:autocmd FileType python :set number 
":autocmd FileType python : set foldmethod=syntax 
:autocmd FileType python :set smartindent 


set guioptions+=m "menu bar
set guioptions+=T "toolbar
set guioptions+=r "scrollbar


"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
"inoremap " ""<ESC>i

" NERD tree configuration
" if only directory tree, close vim
autocmd vimenter * if !argc() | NERDTree | endif 
" \n open directory tree
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <F5> :NERDTreeToggle<cr>

" ruby compiler
autocmd FileType ruby compiler ruby

" config youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_highlighting = 0
""highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

" vim powerline
"let g:Powerline_symbols = 'fancy'

" config airline
" let airline use powerline fonts
let g:airline_powerline_fonts = 1
" config vim tabline
let g:airline#extensions#tabline#enabled = 1
" set gvim font which can show powerline symbol
" PS: vim font always follow terminal, can't be changed
set guifont=Source\ Code\ Pro\ for\ Powerline:h14 

" no auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
