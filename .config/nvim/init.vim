"Plugins
let s:plugpath = $XDG_DATA_HOME . '/nvim/site/autoload/plug.vim'
if empty(glob(s:plugpath))
  silent !curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/bufferize.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'jesseleite/vim-agriculture'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-plug'
Plug 'justinmk/vim-sneak'
Plug 'liuchengxu/vista.vim'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'commit': 'fb123ed', 'do': 'yarn install --frozen-lockfile'}
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/echodoc.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'zefei/vim-wintabs'
"" Colours
Plug 'morhetz/gruvbox'
call plug#end()
colorscheme gruvbox
call coc#add_extension(
  \   'coc-java',
  \   'coc-json',
  \   'coc-lists',
  \   'coc-marketplace',
  \   'coc-omnisharp',
  \   'coc-python',
  \   'coc-rust-analyzer',
  \   'coc-spell-checker',
  \   'coc-svelte',
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

"" Plaintext filetype, no syntax highlighting.
augroup txtFileType
  au!
  au BufNewFile,BufRead,BufReadPost *.txt set filetype=txt
augroup END

"" When jumping to a COC placeholder, show signature
augroup configCocJumpPlaceholder
  au!
  au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

"" When a file is changed, reload it
augroup configFileChanged
  au!
  au FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Reloaded." | echohl None
  au FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
augroup END

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
noremap <leader>l ("\<C-l>")
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
nmap <silent> [h  <Plug>(coc-diagnostic-prev)
nmap <silent> ]h  <Plug>(coc-diagnostic-next)
nmap          gj  <Plug>(wintabs_next)
nmap          gk  <Plug>(wintabs_previous)
nmap <silent> gld <Plug>(coc-definition)
nmap <silent> gli <Plug>(coc-implementation)
nmap <silent> glr <Plug>(coc-references)
nmap  <leader>aa  <Plug>(coc-codeaction)
nmap  <leader>al  <Plug>(coc-codeaction-line)
nmap  <leader>an  <Plug>(coc-rename)
nmap  <leader>ar  <Plug>(coc-refactor)
nmap  <leader>e   :NERDTreeToggle<CR>
nmap  <leader>ff  :Leaderf file<CR>
nmap  <leader>fh  :Leaderf help<CR>
nmap  <leader>fl  :Leaderf loclist<CR>
nmap  <leader>fm  :Leaderf mru<CR>
nmap  <leader>fq  :Leaderf quickfix<CR>
nmap  <leader>fr  :Leaderf rg --max-columns=200<CR>
nmap  <leader>O   <Plug>(wintabs_only)
nmap  <leader>q   <Plug>(wintabs_close)
nmap  <leader>Q   <Plug>(wintabs_undo)
nmap  <leader>v   :Vista!!<CR>
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
set noswapfile
set ignorecase
set mouse=a
set updatetime=300
set notimeout
"" Coloring
set nohlsearch
set colorcolumn=80
set synmaxcol=0
set termguicolors
"" Coloring - Crosshair
set cursorcolumn
highlight CursorColumn ctermfg=White ctermbg=238 cterm=bold guifg=white guibg=#444444 gui=bold
set cursorline
highlight CursorLine ctermfg=White ctermbg=238 cterm=bold guifg=white guibg=#444444 gui=bold
"" Indentation and whitespace
set expandtab
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set shiftwidth=2
set showbreak=↪
set tabstop=2
"" Gutter
set number
set signcolumn=yes
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
"" Command line
set cmdheight=2
set shortmess+=c
"" Status line
set statusline=%m%r%w%q%y%F
set statusline+=%=
set statusline+=%{FugitiveStatusline()}
set statusline+=[%{coc#status()}%{get(b:,'coc_current_function','')}]
set statusline+=%c,%l/%L(%P)
"" Plugins
let g:coc_disable_startup_warning=1
let g:Lf_CacheDirectory = $HOME . '/.cache/LeaderF'
let g:Lf_RgConfig = [
        \ "--glob=!dist/*",
        \ "--glob=!*.json",
        \ "--glob=!*.lock",
        \ "--glob=!*.md",
        \ "--glob=!*.svg",
    \ ]
let g:loaded_matchparen = 1
let g:ragtag_global_maps = 1
let g:rainbow_active = 1
let g:sneak#label=1
let g:vista_default_executive = 'coc'
