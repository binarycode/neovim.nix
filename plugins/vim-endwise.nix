{ pkgs, ... }: {
  # https://github.com/tpope/vim-endwise
  # close blocks (if/endif etc) automatically

  neovimPlugins = [ pkgs.vimPlugins.vim-endwise ];
}
