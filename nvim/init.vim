
filetype plugin indent on 
set number relativenumber        
syntax on 

colorscheme dracula

"sets the comma as the leader key
let mapleader = ","
set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=v                 " middle-click paste with mouse
"set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions  



call plug#begin('~/.vim/plugged')      

""""Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif 
let g:deoplete#enable_at_startup = 1 
"""""Ayu Theme""""""""""""""""""""""""""""""""""""
Plug 'ayu-theme/ayu-vim' " or other package manager
"... 
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme 
set termguicolors     " enable true colors support 
" A Vim Plugin for Lively Previewing LaTeX PDF Output 
Plug 'donRaphaco/neotex', { 'for': 'tex' }
let g:tex_flavor = 'latex'  
"''''Dracula Theme
Plug 'dracula/vim', { 'as': 'dracula' }  
"""Lightline
 Plug 'itchyny/lightline.vim' 
 let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ }
call plug#end()     


