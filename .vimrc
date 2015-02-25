let mapleader=","
set shell=/bin/zsh
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
" " Buffer Directory
" " *************************************************************
set dir=~/.swpfiles
set backupdir=~/.swpfiles
set undodir=~/.undofiles
" " *************************************************************
" " UI Setup 
" " *************************************************************
set history=50
set ruler
set showcmd
set incsearch
set hidden
set relativenumber
"set nocursorline
set mouse=a
" " *************************************************************
" " ctrlp 
" " *************************************************************
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" " *************************************************************
" " Nerd Tree
" " *************************************************************
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
let g:airline#extensions#hunks#enabled=0
" " *************************************************************
" " Tab sizing
" " *************************************************************
filetype plugin indent on " Enable file type detection
filetype indent on        " activates indenting for files
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" " *************************************************************
" " {{ Mustache }}
" " *************************************************************
let g:mustache_abbreviations = 1
" " *************************************************************
" " Syntastic
" " *************************************************************
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" " *************************************************************
" " RSpec
" " *************************************************************
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" " *************************************************************
" " Remaping keys
" " *************************************************************
imap jj <Esc>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
