{ pkgs, ... }: {
  # https://github.com/tpope/vim-unimpaired
  # useful shortcuts

  my = {
    neovimPlugins = [ pkgs.vimPlugins.vim-unimpaired ];

    neominPlugins = [ pkgs.vimPlugins.vim-unimpaired ];
  };
}
