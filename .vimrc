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
autocmd Filetype js setlocal tabstop=2 softtabstop=2 shiftwidth=2 
autocmd Filetype vue setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype json setlocal tabstop=2 softtabstop=2 shiftwidth=2

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

" Remap direction keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Space> j
nnoremap j h
vnoremap <Space> j
vnoremap j h

" Remap escape key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap kj <Esc>

" Set <leader> to comma
"
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
" Plug 'Townk/vim-autoclose'              " Auto-close brackets, quotes
Plug 'StanAngeloff/php.vim'             " PHP syntax highlighter
Plug 'rayburgemeestre/phpfolding.vim'   " PHP auto-folding
Plug 'tomtom/tlib_vim'                  " Required for other plugins
Plug 'MarcWeber/vim-addon-mw-utils'     " Required for other plugins
Plug 'garbas/vim-snipmate'              " Snippets engine
Plug 'freesewing/core-vim-snippets'     " Freesewing core snippets
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'} " PHP code style fixer
Plug 'posva/vim-vue'                    " Syntax highlighting for Vue components
Plug 'editorconfig/editorconfig-vim'    " See editorconfig.org
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

" VIM-PHP-CS-FIXER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><leader>fpd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>fpf :call PhpCsFixerFixFile()<CR>
