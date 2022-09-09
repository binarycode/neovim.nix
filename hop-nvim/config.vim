" move to char
map  <Leader>f :HopChar1<CR>
nmap <Leader>f :HopChar1<CR>
vmap <Leader>f <CMD>HopChar1<CR>

" move to word
map  <Leader>w :HopWord<CR>
nmap <Leader>w :HopWord<CR>
vmap <Leader>w <CMD>HopWord<CR>

" move to line
map  <Leader>l :HopLine<CR>
nmap <Leader>l :HopLine<CR>
vmap <Leader>l <CMD>HopLine<CR>

" required for default hint colors to be set up
lua << EOF
  require('hop').setup()
EOF
