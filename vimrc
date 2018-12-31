"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"   Yan's vimrc!
"
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ***********************************************
" *                                             *
" *                vim settings                 *
" *                                             *
" ***********************************************
" This issue is due to Vim’s need of setting a different term parameter when ran through Tmux

if exists('$TMUX')
  set term=screen-256color
endif
" set listchars=eol:¬,extends:>,precedes:<,space:␣
" set list

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

"修改leader键为逗号
let mapleader=","
let g:mapleader=","

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Set 7 line to the cursor - when moving vertically using j/k
set so=3

" Always show current position
set ruler

" solution Backspace in insert mode doesn't erase the character
set backspace=indent,eol,start

" When searching try to be smart about cases
set smartcase

" No annoying soud on errors
set noerrorbells
set novisualbell

"enc(encoding), fenc(fileencoding), fencs(fileencodings)
"enc 先是当前系统编码
"fenc 当前文件的编码
"fencs 打开文件后的猜测列表
set enc=utf-8
set fenc=utf-8
set fencs=utf8,gbk,gb2312,gb18030
" 探测文件编码检测类型及支持格式

" 系统剪贴板
set clipboard=unnamed

syntax on "自动语法高亮

"检测文件插件类型
filetype plugin on
filetype indent on

set mouse=a "Mouse Support
set nocompatible "关闭兼容模式

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
set wrap

set incsearch "设定即使搜索
set history=500 "历史
set cursorline "高亮编辑行
set noswapfile "无交临时换文件
set showcmd "show cmd

" 将-连接符也设置为单词
" support css word with -
set isk+=-
set iskeyword+=-

" ***********************************************
" *                                             *
" *          vim color/theme setting            *
" *                                             *
" ***********************************************
set go= "去除边框
"set background=light " 背景色

" 主题
set background=dark
let g:solarized_termcolors=256
set hlsearch "搜索高亮

" Use ack instead of grep
" set grepprg=ack

"[Smart way to move between windows]
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Enable folding with the spacebar
nnoremap <space> za

" 现在可以使用gt/gT左右切换tab
" :tabnew  打开文件
" :tabc    关闭当前的tab
" :tabo    关闭所有其他的tab
" :tabs    查看所有打开的tab
" :tabp    前一个
" :tabn    后一个


" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.

Plug 'vim-scripts/L9'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'

Plug 'tpope/vim-fugitive'

Plug 'Lokaltog/vim-easymotion'
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_ShowHidden=1
let g:Lf_ReverseOrder = 1
" Plug 'ctrlpvim/ctrlp.vim'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linuxlet g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
" \ 'dir':  '\v[\/]\.(git|hg|svn)$',
" \ 'file': '\v\.(exe|so|dll)$',
" \ 'link': 'some_bad_symbolic_links',
" \ }
" if executable('find')
" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" endif
" if executable('fd')
" let g:ctrlp_user_command = 'fd -I -H --type f -c never "" %s'
" let g:ctrlp_use_caching = 0
" endif

Plug 'bling/vim-airline'

Plug 'MwumLi/fencview'
let g:fencview_autodetect=0 "关闭自动检测

Plug 'scrooloose/nerdtree'
"I can close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
map <Leader>w <plug>NERDTreeTabsToggle<CR>
map <Leader>t <plug>NERDTreeTabsFind<CR>

Plug 'scrooloose/syntastic'
" let g:syntastic_javascript_checkers = ['eslint']
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
Plug 'Chiel92/vim-autoformat'
let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'
let g:formatters_javascript = ['eslint']
Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'mileszs/ack.vim'
nnoremap <Leader>a :Ack!<space>-i<space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

Plug 'majutsushi/tagbar'
nnoremap <Leader>r :TagbarToggle<CR>
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
if executable('ripper-tags')
  let g:tagbar_type_ruby = {
      \ 'kinds'      : ['m:modules',
                      \ 'c:classes',
                      \ 'C:constants',
                      \ 'F:singleton methods',
                      \ 'f:methods',
                      \ 'a:aliases'],
      \ 'kind2scope' : { 'c' : 'class',
                       \ 'm' : 'class' },
      \ 'scope2kind' : { 'class' : 'c' },
      \ 'ctagsbin'   : 'ripper-tags',
      \ 'ctagsargs'  : ['-f', '-']
      \ }
endif

Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'
Plug 'posva/vim-vue'
Plug 'maralla/completor.vim'
Plug 'masawada/completor-dictionary'
autocmd FileType * execute 'setlocal dictionary='.expand($HOME.'/.vim/dict/'.&filetype.'.dict')

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
