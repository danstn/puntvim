" Standard settings "
"""""""""""""""""""""
syntax on

set number
set ruler
set expandtab
set cursorline
set warn
set autoindent

set mouse=a
set tabstop=2
set list " Show `listchars` characters
set listchars=tab:=»,trail:·
set laststatus=2
set t_Co=256


" Custom settings "
"""""""""""""""""""
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'kien/ctrlp.vim'

" Ctrl-c/x to copy/cut
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" Colorscheme
colorscheme railscasts

execute pathogen#infect()
filetype plugin indent on

"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" NERDTREE PLUGIN - (mnemonic: Files)
nmap <leader>f :NERDTreeToggle
nmap <leader>F :NERDTreeFind
