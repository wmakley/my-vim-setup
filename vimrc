set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" to reload plugins: reload .vimrc, and run either :PluginInstall
" or vim +PluginInstall +qall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'https://github.com/mileszs/ack.vim.git'
Plugin 'https://github.com/ciaranm/detectindent.git'
Plugin 'https://github.com/tpope/vim-commentary.git'
Plugin 'https://github.com/chrisbra/csv.vim.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/tpope/vim-cucumber.git'
Plugin 'https://github.com/tpope/vim-haml.git'
Plugin 'https://github.com/jinfield/vim-nginx.git'
Plugin 'https://github.com/tpope/vim-rails.git'
Plugin 'https://github.com/slim-template/vim-slim.git'
Plugin 'https://github.com/vim-scripts/tlib.git'
Plugin 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plugin 'https://github.com/garbas/vim-snipmate.git'
Plugin 'https://github.com/honza/vim-snippets.git'
Plugin 'https://github.com/tpope/vim-surround.git'

call vundle#end()
filetype plugin indent on

syntax on
" tabs
set expandtab
set softtabstop=2
set tabstop=4
set shiftwidth=2
set smarttab
set backspace=indent,eol,start

set showmatch " highlight all search results
set guioptions-=T " disable bell
set ruler " show cursor position in status bar
set nohls
set incsearch
set hlsearch
set ignorecase
set smartcase
"set hidden
"set virtualedit=all
set wildmenu
set linebreak
set modeline

let mapleader=","

" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,trail:.,eol:¬

" Shortcut to toggle auto-indent of pasted code
set pastetoggle=<leader>v

" Detect extensions vim has no clue about
autocmd FileType ddl set ft=sql

" try to autodetect indent style
autocmd BufReadPost * :DetectIndent

" Syntax of these languages is fussy over tabs vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
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

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f <c-p>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.git/**,*.svn/**
let g:ctrlp_custom_ignore = 'vendor/bundle|tmp|doc/app|doc/plugins|public/product|public/product_image|public/product_document|public/category|public/category_document|public/category_image|public/slide|public/callout|\.git|\.svn|import|price_book|index|plugins-|rails\.old|vendor/cache|\.DS_Store|public/system|public/themes|tiny_mce|public/javascripts/cache|public/stylesheets/cache'

