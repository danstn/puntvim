" Plugins "
"""""""""""
filetype off
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'

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
set hlsearch

set mouse=a
set tabstop=2
set list " Show `listchars` characters
set listchars=tab:=»,trail:·
set laststatus=2
set t_Co=256
set fillchars+=vert:\ 

" Custom settings "
"""""""""""""""""""

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:NERDTreeWinSize = 42


" Custom Mappings "
"""""""""""""""""""

" Ctrl-c/x to copy/cut
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" NerdTree plugin
nmap <leader>f :NERDTreeToggle
nmap <leader>F :NERDTreeFind

"nnoremap <esc> :noh<return><esc>

hi VertSplit guibg=#000000 gui=NONE guifg=#414243 ctermfg=235

