{ pkgs, ... }: {
  # https://github.com/ms-jpq/chadtree
  # file manager

  my.neovimPlugins = [ pkgs.vimPlugins.chadtree ];
}
