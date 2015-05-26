let mapleader=" "
set shell=/bin/zsh
set nocompatible
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
"set dir=~/.swpfiles
"set backupdir=~/.swpfiles
set noswapfile
set undodir=~/.undofiles
" " *************************************************************
" " UI Setup
" " *************************************************************
set history=50
set ruler
set showcmd
set incsearch
set hlsearch
set wildmenu
set lazyredraw
set showmatch
set hidden
set relativenumber
"set nocursorline
set mouse=a
" " *************************************************************
" " ctrlp
" " *************************************************************
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 0
" use ag to build up ctrlp index
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .hg
      \ --ignore .DS_Store
      \ -g ""'
" " *************************************************************
" " Nerd Tree
" " *************************************************************
autocmd StdinReadPre * let s:std_in=1
let NERDTreeQuitOnOpen=1
map <C-n> :NERDTreeToggle<CR>
" " *************************************************************
" " Status Line
" *************************************************************
set laststatus=2
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
let g:airline#extensions#airline#enabled_branch=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#hunks#non_zero_only = 1
" " *************************************************************
" " Tab sizing
" " *************************************************************
filetype plugin indent on
filetype indent on
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
" " RSpec
" " *************************************************************
map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm"
" " *************************************************************
" " Silver Searcher
" " *************************************************************
nnoremap <leader>s :Ag 
" " *************************************************************
" " Remaping keys
" " *************************************************************
imap jj <Esc>
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <leader>v :so ~/.vimrc<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" " *************************************************************
" " Trim Whitespace
" " *************************************************************
function! <SID>StripTrailingWhitespaces()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

autocmd FileType ruby,coffee,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
