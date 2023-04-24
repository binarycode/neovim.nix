if has('termguicolors')
  set termguicolors
endif

colorscheme monokai

lua << EOF
  require('monokai').setup {
    palette = {
      base2 = '#000000'
    }
  }
EOF
