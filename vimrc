set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
" to reload plugins: reload .vimrc, and run either:
"
"   :PluginInstall
"
" or:
"
"   vim +PluginInstall +qall
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" vim-airline and integrations
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-bufferline'
Plugin 'airblade/vim-gitgutter'
Plugin 'https://github.com/scrooloose/syntastic.git'
Plugin 'bling/vim-airline'

Plugin 'https://github.com/mileszs/ack.vim.git'
Plugin 'https://github.com/Raimondi/delimitMate.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/ciaranm/detectindent.git'
Plugin 'https://github.com/tpope/vim-commentary.git'
Plugin 'https://github.com/chrisbra/csv.vim.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
"Plugin 'https://github.com/tpope/vim-cucumber.git'
Plugin 'https://github.com/tpope/vim-haml.git'
Plugin 'https://github.com/jinfield/vim-nginx.git'
Plugin 'https://github.com/tpope/vim-rails.git'
Plugin 'https://github.com/slim-template/vim-slim.git'
Plugin 'https://github.com/vim-scripts/tlib.git'
Plugin 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plugin 'https://github.com/garbas/vim-snipmate.git'
Plugin 'https://github.com/honza/vim-snippets.git'
Plugin 'https://github.com/tpope/vim-surround.git'

Plugin 'https://github.com/kana/vim-textobj-user.git'
Plugin 'https://github.com/nelstrom/vim-textobj-rubyblock.git'
"Plugin 'https://github.com/editorconfig/editorconfig-vim.git'

call vundle#end()
filetype plugin indent on

runtime macros/matchit.vim "needed for rubyblock plugin

syntax on
" tabs
set expandtab
set softtabstop=2
set tabstop=4
set shiftwidth=2
set smarttab
set backspace=indent,eol,start

set showmatch "highlight matching bracket when closing bracket is inserted
set guioptions-=T " disable bell
set ruler " show cursor position in status bar
set nohls
set incsearch "update search live while typing
set hlsearch "highlight all search results
set ignorecase "make search case-insensitive
set smartcase "make search case-sensitive if any upper-case letters are typed
"set hidden
"set virtualedit=all " allow moving cursor where no characters exist
set wildmenu
set linebreak
set modeline
set showcmd

"== AIRLINE SETUP ==
let g:airline_powerline_fonts = 1 " uncomment if you have powerline fonts installed
let g:airline#extensions#csv#enabled = 1
set laststatus=2 " always show airline status bar
set noshowmode

"== EDITORCONFIG ==
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" syntastic
let g:syntastic_ruby_exec = 'ruby'

let mapleader=","

" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,trail:.,eol:¬

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
if executable('ag')
  let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
	\ --ignore .git
	\ --ignore .svn
	\ --ignore .hg
	\ --ignore .DS_Store
	\ --ignore "**/*.pyc"
	\ --ignore "._*"
	\ --ignore "**/public/system/**"
	\ -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" Automatically jump to end of text you pasted:
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

