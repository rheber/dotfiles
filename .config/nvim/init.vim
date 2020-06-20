"Plugins
let s:plugpath = $XDG_DATA_HOME . '/nvim/site/autoload/plug.vim'
if empty(glob(s:plugpath))
  silent !curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'AndrewRadev/undoquit.vim'
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'jesseleite/vim-agriculture'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-plug'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'RRethy/vim-illuminate'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/echodoc.vim'
Plug 'TaDaa/vimade'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'unblevable/quick-scope'
Plug 'wellle/targets.vim'
"" Colours
Plug 'morhetz/gruvbox'
"Plug 'tomasr/molokai'
call plug#end()
colorscheme gruvbox
call coc#add_extension(
  \   'coc-explorer',
  \   'coc-java',
  \   'coc-json',
  \   'coc-lists',
  \   'coc-marketplace',
  \   'coc-python',
  \   'coc-spell-checker',
  \   'coc-tsserver',
  \   'coc-vimlsp',
  \ )

" Functions
function! s:DeleteHiddenBuffers()
  let l:tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(l:tpbl, tabpagebuflist(v:val))')
  for l:buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(l:tpbl, v:val)==-1')
    silent execute 'bwipeout' l:buf
  endfor
endfunction
function! s:ActivateHighlighting()
  :ColorHighlight!
  :SemanticHighlight
endfunction
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Commands
"" Clean up buffer list
command! DeleteHiddenBuffers call s:DeleteHiddenBuffers()
"" Dumb snippets
command! -nargs=1 Snip :read $HOME/.config/editor/snippets/<args>

" Autocommands
"" When a buffer loads, colorise it
au BufEnter,BufNewFile,BufRead * call s:ActivateHighlighting()
"" When a file is changed, reload it
au FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Reloaded." | echohl None
au FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

"Abbreviations
"" New-tab help
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'

" Keymaps
let g:mapleader = " "
let g:maplocalleader = ","
"" No-ops
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
"" Quit
nnoremap <c-d> :qa<CR>
"" Tabs
nnoremap <leader>te :tabe<CR>
nnoremap <leader>ts :tab<space>sp<CR>
"" Plugins
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <leader>aa  <Plug>(coc-codeaction)
nmap <leader>al  <Plug>(coc-codeaction-line)
nmap <leader>e :CocCommand explorer<CR>
nmap <leader>h :SemanticHighlightToggle<CR>
nmap <leader>rf  <Plug>(coc-refactor)
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
set mouse=a
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
"" Folds
set nofoldenable
set foldcolumn=4
set foldmethod=indent
"" Buffers and tabs
set hidden
set showtabline=2
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
let g:ragtag_global_maps = 1
let g:rainbow_active=1
let g:sneak#label=1
let g:vimade = { "enablefocusfading": 1 }
