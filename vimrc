""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            VUNDLE SETUP & PACKAGES                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
"set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'godlygeek/tabular'
Plugin 'bogado/file-line'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'pangloss/vim-javascript'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'junegunn/limelight.vim'

" Auto completion engine
Plugin 'Valloric/YouCompleteMe'
" Snippets engine
Plugin 'SirVer/ultisnips'
" Snippets collection
Plugin 'honza/vim-snippets'

call vundle#end()
call yankstack#setup()

filetype plugin indent on   " load filetype-specific indent files



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            STANDARD VIM SETTIGNS                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme solarized

set autoindent   " enable automatic indentation
set cursorline   " highlight current line
set expandtab
set hlsearch     " highlight search results
set ignorecase   " case insensitive search
set incsearch
set list         " Show `listchars` characters
set nofoldenable
set number       " show line numbers
set ruler
set showcmd      " show command in bottom bar
set showmatch    " highlight matching [{()}]
set smartcase    " use case sensitive search if a capital letter is used
set warn         " show current mode
set wildmenu     " visual autocomplete for command menu

set backspace=indent,eol,start
set cc=81,121
set fillchars+=vert:\ 
set foldlevel=10
set laststatus=2
set listchars=tab:=»,trail:·
set mouse=a
set pastetoggle=<F2>
set shiftwidth=2
set t_Co=256
set tabstop=2
set textwidth=120


" MAPPINGS
""""""""""""""""""""""""""""""""""""""""
map Y y$
inoremap <Nul> <C-n>

" System's clipboard integration
map <leader>p "+p
map <leader>y "+y

"nnoremap <esc> :noh<return><esc>
:noremap <Space>n :cnext<C-m>
:noremap <Space>p :cprev<C-m>
:nnoremap <F5> :buffers<CR>:buffer<Space>


" HIGHLIGHTS
""""""""""""""""""""""""""""""""""""""""
hi clear VertSplit
hi clear SignColumn



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              PLUGIN SETTINGS                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Tag Bar
""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>


" NERDTree
""""""""""""""""""""""""""""""""""""""""
nmap <leader>f :NERDTreeToggle
nmap <leader>F :NERDTreeFind
let g:NERDTreeWinSize = 42
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" Ctrl-P
""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map           = '<c-p>'
let g:ctrlp_cmd           = 'CtrlP'
let g:ctrlp_match_window  = 'bottom,order:ttb,min:3,max:10,results:50'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/](node_modules)$'


" Multi cursor
""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-S-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'


" UltiSnip
""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<c-j>"


" Tabularize
""""""""""""""""""""""""""""""""""""""""
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
endif


" Airline
""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='solarized'


" GitGutter
""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_column_always = 1

" LimeLight
""""""""""""""""""""""""""""""""""""""""
let g:limelight_conceal_ctermfg = 0
