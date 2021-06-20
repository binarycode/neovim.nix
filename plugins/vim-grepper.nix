{ pkgs, ... }: {
  # https://github.com/mhinz/vim-grepper
  # search with ripgrep or silver searcher

  neovimRC = [
    ''
      " search with silver searcher
      nnoremap <leader>ga :GrepperAg<space>

      " search with ripgrep
      nnoremap <leader>gr :GrepperRg<space>

      " reset config
      let g:grepper = {}

      " use ripgrep or silver searcher
      let g:grepper.tools = ['ag', 'rg']
    ''
  ];

  neovimPlugins = [ pkgs.vimPlugins.vim-grepper ];
}
