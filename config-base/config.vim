" replace tabs with spaces
set expandtab

" number of spaces for each indent step
set shiftwidth=2

" tab size for editing operations (like <Tab> and <BS>)
set softtabstop=2

" editing operations use softtabstop value
set smarttab

" show line numbers
set number

" highlight all search matches
set hlsearch

" incremental search
set incsearch

" enable modeline
set modeline

" redraw only when needed
set lazyredraw

" disable auto comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" cursor line is always at screen center
set so=999

" statusline always visible
set laststatus=2

" allow backspacing over a lot of things
set backspace=indent,eol,start

" make whitespace visible
set nolist
set listchars=""
set listchars+=space:⋅
set listchars+=eol:↴

" use clipboard for all operations
set clipboard+=unnamedplus

" make vim work correctly with watch/livereload tools
set backupcopy=yes
set backupdir=/tmp//
set directory=/tmp//
set backupdir=/tmp//

" always use vertical diffs
set diffopt+=vertical

" use spacebar as Leader
let mapleader = "\<Space>"

" hide search highlight on escape
nnoremap <esc> :noh<return><esc>

" navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" quick page scrolling
map J <PageDown>
map K <PageUp>


" Copy current path to buffer
nmap ,cs :let @+=fnamemodify(expand("%"), ":~:.")<CR>
nmap ,cl :let @+=expand("%:p")<CR>
