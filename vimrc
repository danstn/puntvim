" Plugins "
"""""""""""
filetype off
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on


" Standard settings "
"""""""""""""""""""""
syntax on
colorscheme railscasts

set number
set ruler
set expandtab
set cursorline
set warn
set autoindent
set smartcase

set mouse=a
set tabstop=2
set list " Show `listchars` characters
set listchars=tab:=»,trail:·
set laststatus=2
set t_Co=256

" Custom settings "
"""""""""""""""""""

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" Custom Mappings "
"""""""""""""""""""

" Ctrl-c/x to copy/cut
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" NerdTree plugin
nmap <leader>f :NERDTreeToggle
nmap <leader>F :NERDTreeFind
