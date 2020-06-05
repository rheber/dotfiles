" Autocommands
"" Reload changed files
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Reloaded." | echohl None

" Key bindings
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
"" New-tab help
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'

" Settings
"" Miscellany
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
