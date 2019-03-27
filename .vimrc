syntax on  
colorscheme synthwave


execute pathogen#infect() 

filetype plugin indent on 

set spell

set number relativenumber    
set wildmenu 
set wildmode=list:longest,full

call plug#begin('~/.vim/plugged')   
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } 
" Vim plugin for centering text 
Plug 'junegunn/goyo.vim' 
"vimtex 
Plug 'lervag/vimtex' 
"neomake 
Plug 'neomake/neomake'  
"multiple cursors
Plug 'terryma/vim-multiple-cursors' 
"buffer explorer
Plug 'jlanzarotta/bufexplorer'
call plug#end()    

let g:tex_flavor = 'latex'
let g:livepreview_previewer = 'zathura' 
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
set rtp+=~/.fzf

