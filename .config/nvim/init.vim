"Plugins
let plugpath = $XDG_DATA_HOME . '/nvim/site/autoload/plug.vim'
if empty(glob(plugpath))
  silent !curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'frazrepo/vim-rainbow'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-plug'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasr/molokai'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
call plug#end()

" Functions
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Commands
"" Dumb snippets
command -nargs=1 Snip :read $HOME/.config/editor/snippets/<args>

" Autocommands
"" Reload changed files
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Reloaded." | echohl None
"" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"Abbreviations
"" New-tab help
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'

" Keymaps
let mapleader = " "
let maplocalleader = ","
"" No-ops
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <CR> <Nop>
noremap <space> <Nop>
noremap <backspace> <Nop>
noremap , <Nop>
noremap - <Nop>
noremap + <Nop>
"" Rearranging
noremap ; :
noremap <leader>; ;
noremap <leader>, ,
"" Menu navigation
cnoremap <expr> <c-j> ("\<C-n>")
cnoremap <expr> <c-k> ("\<C-p>")
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
"" Plugins
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>e :CocCommand explorer<CR>
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>rn  <Plug>(coc-rename)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Settings
"" Miscellany
set nohlsearch
set noswapfile
set ignorecase
set termguicolors
set updatetime=300
"" Information
set cmdheight=2
set colorcolumn=80
set cursorcolumn
set cursorline
set number
set shortmess+=c
set signcolumn=yes
"" Indentation and whitespace
set expandtab
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set shiftwidth=2
set showbreak=↪
set tabstop=2
"" Buffers and tabs
set hidden
set splitbelow
set splitright
set switchbuf=usetab,newtab
"" Statusline
set statusline=%m%r%w%q%y%F
set statusline+=%=
set statusline+=%{FugitiveStatusline()}
set statusline+=[%{coc#status()}%{get(b:,'coc_current_function','')}]
set statusline+=%c,%l/%L(%P)
"" Plugins
let g:coc_disable_startup_warning=1
colorscheme molokai
let g:rainbow_active=1
let g:sneak#label=1
