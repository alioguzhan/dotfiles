call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'

Plug 'itchyny/lightline.vim'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'preservim/nerdtree'

Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'

call plug#end()
" enable syntax highlighting
syntax on

" show line numbers
set number

" show file stats
set ruler

" set encoding
set encoding=utf-8

set modelines=0

" whitespace related
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Allow hiden buffers
set hidden

" Rendering
set ttyfast

if !has('gui_running')
  set t_Co=256
endif

set laststatus=2
set noshowmode
filetype plugin indent on
