syntax on
filetype plugin indent on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2
set foldmethod=indent
set number
set wildmenu
set incsearch
set mouse=a
set clipboard=unnamedplus

colorscheme darkblue 

" --- Recommended settings ---

" Search enhancements
set hlsearch      " Highlight search results
set ignorecase    " Ignore case in searches
set smartcase     " Case-sensitive search if uppercase letters are used

" UI improvements
set showmatch     " Show matching brackets
set cursorline    " Highlight the current line
set ruler         " Show cursor position
set laststatus=2  " Always show the status line

" Editing experience
set scrolloff=5   " Keep 5 lines of context above/below the cursor


call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
call plug#end()


" LaTeX
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_method = 'zathura'
