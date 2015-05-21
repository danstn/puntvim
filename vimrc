""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            VUNDLE SETUP & PACKAGES                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
"set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'bogado/file-line'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/limelight.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jelera/vim-javascript-syntax'

call vundle#end()
call yankstack#setup()

filetype plugin indent on   " load filetype-specific indent files


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            STANDARD VIM SETTIGNS                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set bg=dark
syntax on
colorscheme distinguished

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
set hidden

set backspace=indent,eol,start
set cc=81,121
set fillchars+=vert:\ 
set foldlevel=10
set laststatus=2
set listchars=tab:=»,trail:·
set mouse=a
set pastetoggle=<F2>
set shiftwidth=2
set tabstop=2
set textwidth=120
set scrolloff=5

" Jump to the previous location when opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" MAPPINGS
""""""""""""""""""""""""""""""""""""""""
map Y y$
inoremap <Nul> <C-n>

" System's clipboard integration
map <leader>p "+p
map <leader>y "+y
nmap <Leader>l :bnext<CR>
nmap <Leader>h :bprevious<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Clear highlighed search
nmap <silent> ,/ :nohlsearch<CR>

:nnoremap * *``
:noremap <Space>n :cnext<C-m>
:noremap <Space>p :cprev<C-m>
:noremap <Space>bn :bnext<CR>
:noremap <Space>bp :bprevious<CR>
:nnoremap <F5> :buffers<CR>:buffer<Space>

" Save as sudo
cmap w!! w !sudo tee % >/dev/null


" HIGHLIGHTS
""""""""""""""""""""""""""""""""""""""""
"hi clear VertSplit
hi clear SignColumn
hi NonText ctermfg=233
hi LineNr ctermfg=235 ctermbg=black
hi Comment ctermbg=none ctermfg=242
hi CursorLine ctermbg=233
"hi VertSplit ctermfg=black


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
let g:NERDTreeWinSize = 32
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
let g:UltiSnipsExpandTrigger = "<C-j>"


" Tabularize
""""""""""""""""""""""""""""""""""""""""
vmap <leader><tab>p :Tabularize /\|<CR>
vmap <leader><tab>= :Tabularize /=<CR>
vmap <leader><tab>: :Tabularize /:<CR>
vmap <leader><tab><tab> :Tabularize /


" Airline
""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'dark'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_powerline_fonts = 1


" GitGutter
""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_column_always = 0


" LimeLight
""""""""""""""""""""""""""""""""""""""""
let g:limelight_conceal_ctermfg = 0


" NeoComplete
""""""""""""""""""""""""""""""""""""""""
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#sources#syntax#min_keyword_length = 5


" YCM
""""""""""""""""""""""""""""""""""""""""
let g:ycm_min_num_of_chars_for_completion = 2


" RSpec.vim mappings
""""""""""""""""""""""""""""""""""""""""
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


" Yankstack mappings
""""""""""""""""""""""""""""""""""""""""
nmap <leader>o <Plug>yankstack_substitute_older_paste
nmap <leader>i <Plug>yankstack_substitute_newer_paste
