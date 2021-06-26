{ pkgs, ... }: {
  # https://github.com/mhinz/vim-grepper
  # search with ripgrep or silver searcher

  my = {
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
    neovimPlugins = [
      # upstream plugin has issue with ripgrep integration, using fork meanwhile
      # https://github.com/mhinz/vim-grepper/issues/244
      # TODO: revisit this later and revert to upstream
      # pkgs.vimPlugins.vim-grepper

      (pkgs.vimUtils.buildVimPluginFrom2Nix {
        pname = "vim-grepper";
        version = "2020-06-20";
        src = pkgs.fetchFromGitHub {
          owner = "binarycode";
          repo = "vim-grepper";
          rev = "2171b2eff948e529266bba3cad463415fdd9cfb5";
          sha256 = "11q9zyz6lr3kycgw2kg6ih2ldaiap5im7rrc85pi6ffdmhm849s5";
        };
      })
    ];
  };
}
