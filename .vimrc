set nocompatible  " be iMproved, required

filetype off      " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   BASIC CONFIGURATION
"

" Life is short, update fast
set updatetime=100

" Line numbers
set number

" Tab handling
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Keep cursor more in middle when scrolling down / up
set scrolloff=15

" no swap file! This is just annoying
set noswapfile

" write automatically when quitting buffer
set autowrite

" Add syntax highlighting
if has("syntax")
  syntax on
endif

" And make sure it's readable on a dark background
set background=dark

" Jump to the latest line when re-opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		    " Hide buffers when they are abandoned

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   CUSTOM KEY MAPPINGS
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable arrow keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Set <leader> to comma
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:let mapleader = ","

" Map Fold Toggle from zi to ft
map ft zi   
" Map Fold Open from za to fo
map fo za   
" Map Fold Close from zc to fc
map fc zc   


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   PLUGIN HANDLING
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/nvim/plugged')  

Plug 'tpope/vim-fugitive'               " Figutive for Git integration
Plug 'airblade/vim-gitgutter'           " Git gutter keeps track of changes
Plug 'itchyny/lightline.vim'            " Lightline status bar
Plug 'scrooloose/nerdtree'              " File tree
Plug 'Townk/vim-autoclose'              " Auto-close brackets, quotes
Plug 'StanAngeloff/php.vim'             " PHP syntax highlighter
Plug 'rayburgemeestre/phpfolding.vim'   " PHP auto-folding
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'freesewing/core-vim-snippets'
"Plug 'honza/vim-snippets'
"" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'mkusher/padawan.vim', 
" Plug 'padawan-php/deoplete-padawan', {'for': 'php'}
" " Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
" " Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
" " Plug 'nishigori/vim-php-dictionary', {'for': 'php'}
" " Plug 'phpstan/vim-phpstan', {'for': 'php'}
" 
" " Namespaces
" Plug 'arnaud-lb/vim-php-namespace'
" 
" " Fuzzy search
" Plug 'junegunn/fzf.vim'
" 
" " Linters
" Plug 'neomake/neomake'
" Plug 'adoy/vim-php-refactoring-toolbox'
" Plug 'stephpy/vim-php-cs-fixer'
" Plug 'phpactor/phpactor'
" 
" " Snippets
" Plug 'honza/vim-snippets'
" 
" " tmux stuff
" Plug 'tmux-plugins/vim-tmux' | Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'christoomey/vim-tmux-navigator'
" 
" " markdown 
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown', {'for': 'md'}
" 
" 
" " undo tree
" Plug 'sjl/gundo.vim'
" 
call plug#end()  


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   PLUGIN CONFIGURATION
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" LIGHTLINE PLUGIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 " Force display
set noshowmode " Don't show -- INSERT --
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" GITGUTTER PLUGIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_max_signs = 100 " Disable when a file has more than 100 changes

" Custom next/previous hunk mapping
nmap <leader>nh <Plug>GitGutterNextHunk
nmap <leader>ph <Plug>GitGutterPrevHunk

" NERDTREE PLUGIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>tre :NERDTreeToggle<CR>
