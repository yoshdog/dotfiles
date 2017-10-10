let mapleader=" "
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
set number
"set relativenumber
"set nocursorline
set mouse=a
set list listchars=tab:»·,trail:·,nbsp:·
set clipboard=unnamed
" " *************************************************************
" " ctrlp
" " *************************************************************
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 0
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
let g:path_to_matcher = "/usr/local/bin/matcher"

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

if executable('matcher')
    let g:ctrlp_match_func = { 'match': 'GoodMatch' }

    function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)

      " Create a cache file if not yet exists
      let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
      if !( filereadable(cachefile) && a:items == readfile(cachefile) )
        call writefile(a:items, cachefile)
      endif
      if !filereadable(cachefile)
        return []
      endif

      " a:mmode is currently ignored. In the future, we should probably do
      " something about that. the matcher behaves like "full-line".
      let cmd = 'matcher --limit '.a:limit.' --manifest '.cachefile.' '
      if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
        let cmd = cmd.'--no-dotfiles '
      endif
      let cmd = cmd.a:str

      return split(system(cmd), "\n")

    endfunction
end
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
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#airline#enabled_branch=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_section_c=""
let g:airline_section_y=""
let g:airline_section_z="%f"
let g:airline_section_warning=""
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
" " RSpec
" " *************************************************************
map <Leader>c :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
"let g:rspec_command = "!spring rspec {spec}"
let g:rspec_command = "!rspec {spec}"
let g:rspec_runner = "os_x_iterm2"
" " *************************************************************
" " Autocomplete
" " *************************************************************
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:tsuquyomi_completion_detail = 1
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

autocmd FileType ruby,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
