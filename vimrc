call pathogen#infect()
call pathogen#helptags()

syntax on
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

filetype plugin on
filetype indent on

" tortus CSS files use tab characters
autocmd FileType css setlocal ts=4 sts=4 sw=4 noexpandtab 
" Syntax of these languages is fussy over tabs vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ddl set ft=sql
autocmd FileType markdown setlocal ts=4 sts=4 sw=4 expandtab

" automatically reload files and .vimrc
set autoread
"autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" nginx syntax higlighting
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile


"command-t
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>f :CommandT<cr>
map <leader>F :CommandT %%<cr>
map <leader>u :CommandTFlush<cr>:CommandT<cr>
set wildignore+=tmp/**,doc/app/**,doc/plugins/**,public/product/**,public/product_image/**,public/product_document/**,public/category/**,public/category_document/**,public/category_image/**,public/slide/**,public/callout/**,import/product/**,import/product_image/**,*images/**,*.git/**,*.svn/**,import/**,price_book/**,index/**,*plugins-*,*rails.old*,vendor/cache/**,*.DS_Store*,public/system/**,public/themes/**,*/tiny_mce/**,public/javascripts/cache/**,public/stylesheets/cache/**

