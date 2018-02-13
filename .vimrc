set nocompatible  " be iMproved, required
filetype off      " required

" Plugins
call plug#begin('~/nvim/plugged')  

" Sensible defaults
Plug 'tpope/vim-sensible'

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tags
Plug 'ludovicchabant/vim-gutentags'

" File tree
Plug 'scrooloose/nerdtree'

" Yank buffer
Plug 'vim-scripts/YankRing.vim'

" Quit buffer, not vim
Plug 'moll/vim-bbye'

" More tpope plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'

" Auto-close brackets
Plug 'Townk/vim-autoclose'

" Project file managements
Plug 'amiorin/vim-project'

" Better PHP syntax highlighting
Plug 'StanAngeloff/php.vim'

" PHP auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mkusher/padawan.vim', 
Plug 'padawan-php/deoplete-padawan', {'for': 'php'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
Plug 'nishigori/vim-php-dictionary', {'for': 'php'}
Plug 'phpstan/vim-phpstan', {'for': 'php'}

" Namespaces
Plug 'arnaud-lb/vim-php-namespace'

" Fuzzy search
Plug 'junegunn/fzf.vim'

" Linters
Plug 'neomake/neomake'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'phpactor/phpactor'

" Snippets
Plug 'honza/vim-snippets'

" tmux stuff
Plug 'tmux-plugins/vim-tmux' | Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

" markdown 
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': 'md'}

" status bar
Plug 'itchyny/lightline.vim'

" undo tree
Plug 'sjl/gundo.vim'

call plug#end()  



" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Line numbers
set number

" Spaces for tabs
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

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
