" Configuration file for vim
set modelines=0 " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible " Use Vim defaults instead of 100% vi compatibility
set backspace=2 " more powerful backspacing
syntax enable
set showmode
set showcmd
set t_Co=256
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set guifont=Monaco:h16

set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

set number
set cursorline
set wrap
set linebreak
set wrapmargin=0

" 防止自动换行
set textwidth=0

set showmatch
set hlsearch
set ignorecase
set smartcase
set undofile
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
" Add these to crontab to auto remove old history then 1 week
" # Remove vim history
" "@daily find ~/.vim/.undo -type f -name '*;*' -not \( -atime 0 -or -atime 1 -or -atime 2 -or -atime 3 -or -atime 4 -or -atime 5 -or -atime 6 \) -delete
" "@daily find ~/.vim/.backup -type f -name '*;*' -not \( -atime 0 -or -atime 1 -or -atime 2 -or -atime 3 -or -atime 4 -or -atime 5 -or -atime 6 \) -delete
" "@daily find ~/.vim/.swp -type f -name '*;*' -not \( -atime 0 -or -atime 1 -or -atime 2 -or -atime 3 -or -atime 4 -or -atime 5 -or -atime 6 \) -delete
set autochdir

set autochdir
set visualbell
set history=500
set autoread
"如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块。
set listchars=tab:»■,trail:■
set list
"命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令。
set wildmenu
set wildmode=longest:list,full

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

"For vundle
"To use vundle, run ` git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall` first!
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"plugins begin
Plugin 'VundleVim/Vundle.vim'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'morhetz/gruvbox'
Plugin 'Raimondi/delimitMate'
let g:delimitMate_expand_cr = 1
"plugins end
call vundle#end()
filetype plugin indent on
colorscheme gruvbox
set background=dark
"colorscheme molokai

"Setting for Vim-autoformat
"for astyle
let g:formatdef_my_cpp = '"astyle --style=google"'
let g:formatters_cpp = ['my_cpp']
"保存文件时自动缩进：au BufWrite * :Autoformat

"自动打开跳到上次的光标位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"macro
let @m = 'a $ $??ah'


set clipboard+=unnamedplus
