{ pkgs, ... }: {
  # https://github.com/tpope/vim-endwise
  # close blocks (if/endif etc) automatically

  my.neovimPlugins = [ pkgs.vimPlugins.vim-endwise ];
}
