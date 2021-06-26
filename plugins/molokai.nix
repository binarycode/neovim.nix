{ pkgs, ... }: {
  # https://github.com/tomasr/molokai
  # colorscheme

  my = {
    neovimRC = [ "colorscheme molokai" ];
    neovimPlugins = [ pkgs.vimPlugins.molokai ];
  };
}
