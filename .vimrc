set nocompatible          " Use Vim settings, rather than Vi settings.
set backspace=indent,eol,start
execute pathogen#infect()
" " *************************************************************
" " Colour scheme
" " *************************************************************
syntax enable
set background=dark
colorscheme solarized
" " *************************************************************
" " UI Setup 
" " *************************************************************
set history=50
set ruler
set showcmd
set relativenumber
set nocursorline
" " *************************************************************
" " ctrlp 
" " *************************************************************
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" " *************************************************************
" " Nerd Tree
" " *************************************************************
"set nu
autocmd StdinReadPre * let s:std_in=1
let NERDTreeQuitOnOpen=1
map <C-n> :NERDTreeToggle<CR>
" " *************************************************************
" " Status Line
" *************************************************************
let g:airline_theme='luna'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_powerline_fonts=1
set ambiwidth=double
set laststatus=2
set timeoutlen=50
" " *************************************************************
" " Tab sizing
" " *************************************************************
filetype plugin indent on " Enable file type detection
filetype indent on        " activates indenting for files
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" " *************************************************************
" " {{ Mucstache }}
" " *************************************************************
let g:mustache_abbreviations = 1
" " *************************************************************
" " Remaping keys
" " *************************************************************
let mapleader=","
imap jj <Esc>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
