call pathogen#infect()
call pathogen#helptags()

set nocompatible
" tabs
set expandtab
set softtabstop=2
set tabstop=4
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set backspace=indent,eol,start

set showmatch
set guioptions-=T
set ruler
set nohls
set incsearch
set hlsearch
set ignorecase
set smartcase
"set hidden
"set virtualedit=all
set wildmenu
set linebreak

let mapleader=","

" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"xml plugin
let xml_use_xhtml = 1

filetype plugin on
filetype indent on

" tortus CSS files use tab characters
autocmd FileType css setlocal ts=4 sts=4 sw=4 noexpandtab 
" Syntax of these languages is fussy over tabs vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ddl set ft=sql

" automatically reload files and .vimrc
set autoread
"autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile


"command-t
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>f :CommandT<cr>
map <leader>F :CommandT %%<cr>
map <leader>u :CommandTFlush<cr>:CommandT<cr>
set wildignore+=doc/app/**,public/product/**,public/product_image/**,public/product_document/**,public/category/**,public/category_document/**,public/slide/**,public/callout/**,import/product/**,import/product_image/**,*images/**,*.git/**,*.svn/**,import/**,price_book/**,index/**,vendor/cache/**,vendor/rails.old/**,*.DS_Store*,public/system/**,public/themes/**,*/tiny_mce/**,public/javascripts/cache/**,public/stylesheets/cache/**

