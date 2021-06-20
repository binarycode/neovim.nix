{ pkgs, ... }: {
  # https://github.com/preservim/nerdcommenter
  # commenting shortcuts

  neovimPlugins = [ pkgs.vimPlugins.nerdcommenter ];
}
