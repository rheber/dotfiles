" Simple settings
" Miscellany
set nocompatible
set noswapfile
set encoding=utf-8
set term=screen-256color
set ttyfast
colorscheme slate
" Information
set colorcolumn=80
set cursorcolumn
set cursorline
set laststatus=2
set number
set ruler    " Row and column number
set showcmd  " Keystrokes
set showmode
set title
set wildmenu " Display all file matches for tab completion
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
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype indent plugin on
syntax on
packadd! matchit

let g:netrw_banner=0      " Hide file browser banner
let g:netrw_liststyle=3   " Set file browser to tree view
let g:netrw_sizestyle='H' " Human-readable file sizes

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

" Remaps
" No arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>
" Fast Ex mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" Literals
inoremap <S-Tab> <C-V><Tab>
