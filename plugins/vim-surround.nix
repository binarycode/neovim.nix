{ pkgs, ... }: {
  # https://github.com/tpope/vim-surround
  # mappings to edit pairs: brackets, tags etc

  neovimPlugins = [ pkgs.vimPlugins.vim-surround ];
}
