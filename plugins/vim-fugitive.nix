{ pkgs, ... }: {
  # https://github.com/tpope/vim-fugitive
  # git wrapper

  my.neovimPlugins = [ pkgs.vimPlugins.vim-fugitive ];
}
