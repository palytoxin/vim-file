" ========================================================================
" Yan's vimrc!
" Vunble Install Quick start
" Setup Vundle:
" 1.
"  $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 2.
"  use 'BundleInstall!' force update plugins
" ========================================================================

"***********************************************
"*                                             *
"*                vim settings                 *
"*                                             *
"***********************************************
" This issue is due to Vim’s need of setting a different term parameter when ran through Tmux. 
if exists('$TMUX')
  set term=screen-256color
endif

let mapleader="," "修改leader键为逗号
"enc(encoding), fenc(fileencoding), fencs(fileencodings)
"enc 先是当前系统编码
"fenc 当前文件的编码
"fencs 打开文件后的猜测列表
set enc=utf-8
set fenc=utf-8
set fencs=cp936,gbk,gb2312,gb18030,ucs-bom,utf-8 " 探测文件编码检测类型及支持格式

syntax on "自动语法高亮

"检测文件插件类型
filetype plugin on
filetype indent on

set go= "去除边框
"set background=light " 背景色

" 主题
set background=dark
let g:solarized_termcolors=256

"set guifont=Monaco:h10 "字体
set hlsearch "搜索高亮
"set mouse=a "Mouse Support
set nocompatible "关闭兼容模式
"filetype on "检测文件类型 vundle管理用


set number "显示行号
set expandtab " To insert space char whenever the tab key is pressed.
set tabstop=2 "tab长度
set shiftwidth=2 "缩进宽度为4
set smarttab

set foldmethod=syntax " 根据缩进设置折叠
set foldlevelstart=99 "打开文件默认不折叠代码
set nobackup "覆盖文件无备份

"缩进
set smartindent
set autoindent

set incsearch "设定即使搜索
set history=60 "历史
set cursorline "高亮编辑行
set noswapfile "无交临时换文件
set showcmd "show cmd

map <c-o> :CtrlPBuffer<CR> " ctrl+o for LRU buffer

" 将-连接符也设置为单词
" support css word with -
set isk+=-
set iskeyword+=-

"记录上次编辑位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

"***********************************************
"*                                             *
"*             Vundle settings                 *
"*                                             *
"***********************************************
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

set backspace=indent,eol,start " solution Backspace in insert mode doesn't erase the character
set nocompatible               " be iMproved, required
filetype off                   " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
" alternatively, pass a path where Vundle should install plugins

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'gmarik/vundle'

"***********************************************
"*                                             *
"*             Plugin settings                 *
"*                                             *
"***********************************************

" [vim-fugitive]
Plugin 'tpope/vim-fugitive' " vim-Git plugin

" [vim-easymotion]
Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>' 

" [L9]
Plugin 'L9'

" [ctrlp]
Plugin 'kien/ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

" [vim-airline]
Plugin 'bling/vim-airline' " statusBar
let g:airline_powerline_fonts = 0
set t_Co=256
set laststatus=2
let g:airline#extensions#tabline#enabled = 0
"let g:airline_detect_whitespace          = 0 "关闭空白符检测
let g:airline_theme                      = "bubblegum" "设定主题
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" [FencView]
Plugin 'MwumLi/fencview' " encoding detect support
let g:fencview_autodetect=0 "关闭自动检测

" [NerdTree]
Plugin 'scrooloose/nerdtree'
nnoremap <leader>w :silent! NERDTreeToggle<CR>
"I can close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" [Syntastic setting]
Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open=1

" [vim-addon-mw-utils]
Plugin 'MarcWeber/vim-addon-mw-utils'

" [tlib_vim]
Plugin 'tomtom/tlib_vim'

" [SnipMateLoadScope]
Plugin 'garbas/vim-snipmate'
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'

" [ACK]
Plugin 'mileszs/ack.vim'

" [auto-pairs]
Plugin 'jiangmiao/auto-pairs'

" [tagslist]
Plugin 'taglist.vim' " ctags support
let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1 
nnoremap <leader>t :TlistToggle<CR>

" [tagbar]
Plugin 'majutsushi/tagbar'
let g:tagbar_width=35
let g:tagbar_autofocus=1
nnoremap <leader>t :TagbarToggle<CR>

" [tabular]
Plugin 'godlygeek/tabular'

" [vim-rails]
Plugin 'tpope/vim-rails.git'
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}


" [sparkup, rails]
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} " rails -erb.html plugin

" [vim-coffee-script]
Plugin 'kchmck/vim-coffee-script'

" [mattn/emmet-vim]
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on 
" All of your Plugins must be added before the following line"
" To ignore plugin indent changes, instead use:
"filetype plugin on

"***********************************************
"*                                             *
"*           vim shortcut settings             *
"*                                             *
"***********************************************

" Use ack instead of grep
set grepprg=ack

"[Smart way to move between windows]
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

"[shift tab pages]
"nnoremap <S-Left> :tabp<CR>
"nnoremap <S-Right> :tabn<CR>
" shortcuts conflict with konsole 

"[help]
" 现在可以使用gt/gT左右切换tab
" :tabnew  打开文件
" :tabc    关闭当前的tab
" :tabo    关闭所有其他的tab
" :tabs    查看所有打开的tab
" :tabp    前一个
" :tabn    后一个



