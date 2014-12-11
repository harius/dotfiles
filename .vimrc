set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/256-grayvim'

filetype plugin indent on

let g:syntastic_python_checkers = ['flake8', 'pylint', 'pep8']
let g:syntastic_python_pylint_post_args='--disable=C0103,C0111'

syntax on

colorscheme 256-grayvim
hi CursorLine cterm=None ctermbg=237
hi ColorColumn ctermbg=60

set ruler
set number
set laststatus=2
set cursorline
set colorcolumn=80
set showcmd

set history=50

set wildignore=*/.git/*,*/.svn/*
set wildignore+=*.o,*.so,*.pyc
set wildmode=longest:full
set wildmenu

set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set smarttab
set expandtab

set nowrapscan
set showmatch
set incsearch

set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r

set backspace=indent,eol,start
set dir=~/.vim/swap_files
set backupcopy=yes

