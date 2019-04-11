syntax on   
syntax enable
colorscheme dracula

filetype plugin indent on 

set number relativenumber    
set wildmenu 
set path+=**

call plug#begin('~/.vim/plugged')   
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }   
Plug 'pboettch/vim-cmake-syntax'    
Plug '~/.fzf'
call plug#end()    

let g:tex_flavor = 'latex'
let g:livepreview_previewer = 'zathura' 
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

