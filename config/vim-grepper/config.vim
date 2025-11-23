" search with ripgrep
nnoremap <leader>gr :GrepperRg<space>

" reset config
let g:grepper = {}

" use ripgrep
let g:grepper.tools = ['rg']
let g:grepper.rg = {}
let g:grepper.rg.grepprg = 'rg -H --no-heading --vimgrep --sort-files'
