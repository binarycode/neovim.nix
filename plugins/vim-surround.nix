{ pkgs, ... }: {
  # https://github.com/tpope/vim-surround
  # mappings to edit pairs: brackets, tags etc

  my = {
    neovimPlugins = [ pkgs.vimPlugins.vim-surround ];

    neominPlugins = [ pkgs.vimPlugins.vim-surround ];
  };
}
