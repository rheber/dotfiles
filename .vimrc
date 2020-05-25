" Simple settings
" Miscellany
set nocompatible
set noswapfile
set encoding=utf-8
set switchbuf=usetab,newtab
set term=screen-256color
set ttyfast
colorscheme slate
" Information
set colorcolumn=80
set cursorcolumn
set cursorline
set laststatus=2
set number
set showcmd
set showmode
set wildmenu
" Whitespace and indentation
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪
set wrap
set backspace=indent,eol,start
set expandtab    " Soft tabs
set shiftwidth=2 " Indent size
set tabstop=2    " Spaces per tab
" Text search
set hlsearch
set incsearch
set ignorecase

" Plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'preservim/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired'
Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype indent plugin on
syntax on
packadd! matchit

let NERDTreeShowHidden=1

let g:syntastic_python_checkers = ['pylint', 'python']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Commands
" Dumb snippets
command -nargs=1 Snip :read $HOME/.vim/snippets/<args>

" Complex settings
" Reload changed files
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Reloaded." | echohl None
" Open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
  \ !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif
" Statusline
set statusline=%m%r%w%q%y%F
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=%c,%l/%L(%P)

" Remaps
" Leader
let mapleader = "\\"
let maplocalleader = ","
" No arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>
" Fast Ex mode
nnoremap ; :
vnoremap ; :
" Displaced characters
nnoremap <leader>; ;
vnoremap <leader>; ;
nnoremap <leader>, ,
vnoremap <leader>, ,
" Literals
inoremap <S-Tab> <C-V><Tab>
" Plugins
nnoremap <leader>n :NERDTreeToggle<CR>
