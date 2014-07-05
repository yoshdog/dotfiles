execute pathogen#infect()
syntax on
set nu
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let g:airline_theme='luna'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_powerline_fonts=1
set ambiwidth=double
set laststatus=2
set timeoutlen=50
colorscheme solarized
let g:solarized_termcolors=256
set background=dark
let &t_Co=256
filetype plugin indent on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
