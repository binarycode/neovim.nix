{ pkgs, ... }: {
  # https://github.com/preservim/nerdcommenter
  # commenting shortcuts

  my.neovimPlugins = [ pkgs.vimPlugins.nerdcommenter ];
}
