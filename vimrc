""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            VUNDLE SETUP & PACKAGES                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
"set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bogado/file-line'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/limelight.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'derekwyatt/vim-scala'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'editorconfig/editorconfig-vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Haskell
Plugin 'bitc/vim-hdevtools'
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'neovimhaskell/nvim-hs'
Plugin 'neovimhaskell/nvim-hs-contrib'
Plugin 'enomsg/vim-haskellConcealPlus'
"Plugin 'neovimhaskell/neovim-ghcmod'

" Javascript
Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'geekjuice/vim-mocha'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'thoughtbot/vim-rspec'

" Swift
Plugin 'keith/swift.vim'

" Ag
Plugin 'rking/ag.vim'

call vundle#end()
call yankstack#setup()

filetype plugin indent on   " load filetype-specific indent files

"autocmd BufWritePost *.hs GhcModCheckAndLintAsync
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
set incsearch    " match the search and return to the initial position
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
set exrc         " support local vimrc
set secure
set nowrap

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
set textwidth=81
set scrolloff=5
set autoread

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

" Make vim remember undos, even when the file is closed!
set undofile                    " save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
set undolevels=1000             " how many undos
set undoreload=10000            " number of lines to save for undo
set tags=tags;/                 " directory tag search (not just local)

" Jump to the previous location when opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Strip whitespace on write
fun! StripTrailingWhitespace()
  if &ft =~ 'vim\|vimrc'
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()
nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


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
:nnoremap <F3> :set wrap!<CR>

" Save as sudo
cmap w!! w !sudo tee % >/dev/null


" HIGHLIGHTS
""""""""""""""""""""""""""""""""""""""""
hi clear SignColumn
hi VertSplit ctermfg=black
hi NonText ctermfg=233
hi LineNr ctermfg=235 ctermbg=black
hi Comment ctermbg=none ctermfg=242
hi CursorLine ctermbg=233
hi clear Visual
hi Visual ctermbg=237

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              PLUGIN SETTINGS                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Hdevtools
au FileType haskell nnoremap <buffer> <F6> :HdevtoolsType<CR>

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
let g:ctrlp_map          = '<c-p>'
let g:ctrlp_cmd          = 'CtrlP'
let g:ctrlp_dont_split   = 'nerdtree'
let g:ctrlp_match_window = 'bottom,order:ttb,min:3,max:10,results:50'
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore .= '\v[\/](node_modules)$'
"let g:ctrlp_custom_ignore .= '\v\.(class|cache|stats)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.(git|hg|svn)$\|\.yardoc\|node_modules\|log\|tmp\|target\|dist$',
  \ 'file': '\v\.(class|cache|stats)$'
  \ }


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
let g:airline_theme = 'wombat' " dark
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 0


" GitGutter
""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_column_always = 0
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" JSX
""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0


" LimeLight
""""""""""""""""""""""""""""""""""""""""
let g:limelight_conceal_ctermfg = 0


" YCM
""""""""""""""""""""""""""""""""""""""""
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" Mocha
""""""""""""""""""""""""""""""""""""""""
let g:mocha_js_command = "!mocha --recursive --compilers js:babel/register test"


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

" Syntastic
""""""""""""""""""""""""""""""""""""""""
nnoremap <F1> :SyntasticCheck<CR> :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': ['haskell', 'scala'] }

hi SyntasticErrorSign ctermbg=none ctermfg=red
hi SyntasticWarningSign ctermbg=none ctermfg=yellow

" Haskell Conceal
""""""""""""""""""""""""""""""""""""""""
let g:no_haskell_conceal = 1
let hscoptions="𝐒Z𝐄"

