" ========================================================================
" Yan's vimrc!
" Vunble Install Quick start
" Setup Vundle:
" 1.
"  $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 2.
"  use 'BundleInstall!' force update plugins
" ========================================================================

"自动语法高亮
syntax on
"去除边框
set go=
" 背景色
"set background=light
set background=dark
" 主题
colorscheme solarized
let g:solarized_termcolors=256
"字体
"set guifont=Monaco:h10
"搜索高亮
set hlsearch
"Mouse Support
set mouse=a
"关闭兼容模式
set nocompatible
"检测文件类型
filetype on
"检测文件插件类型
filetype plugin on
filetype indent on
"显示行号
set number
"tab长度
set tabstop=4
"缩进宽度为4
set shiftwidth=4
set smarttab
"覆盖文件无备份
set nobackup
"缩进
set smartindent
set autoindent
"设定即使搜索
set incsearch
"历史
set history=60
"中文
set fileencodings=utf-8

"记录上次编辑位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

"++++++++++++++++++++++++++++++++++++++++++++++
" 设定Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'L9'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'FencView.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

"++++++++++++++++++++++++++++++++++++++++++++++

"========================>ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

"========================>vim-airline
let g:airline_powerline_fonts = 0
set t_Co=256
set laststatus=2
let g:airline#extensions#tabline#enabled = 0
let g:airline_detect_whitespace          = 0 "关闭空白符检测
let g:airline_theme                      = "bubblegum" "设定主题
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

"========================>Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"========================>shift tab pages
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>

"========================>NerdTree
nnoremap <F8> :silent! NERDTreeToggle<CR>

"========================> Syntastic setting
let g:syntastic_check_on_open=1


"========================>Next...
