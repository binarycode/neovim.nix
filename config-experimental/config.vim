" arrow navigation between splits
nnoremap <Up>    <c-w>k
nnoremap <Down>  <c-w>j
nnoremap <Left>  <c-w>h
nnoremap <Right> <c-w>l

" select blocks after indenting
xnoremap < <gv
xnoremap > >gv|

" use tab for indenting
xnoremap <Tab> >gv|
xnoremap <S-Tab> <gv
nmap >>  >>_
nmap <<  <<_

" compact signs
set signcolumn=number

" tab navigation
nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tj :tabprev<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>td :tabclose<CR>
