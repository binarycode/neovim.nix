{ pkgs, ... }: {
  # https://github.com/tpope/vim-fugitive
  # git wrapper

  neovimPlugins = [ pkgs.vimPlugins.vim-fugitive ];
}
