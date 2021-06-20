{ pkgs, ... }: {
  # https://github.com/tomasr/molokai
  # colorscheme

  neovimRC = [ "colorscheme molokai" ];

  neovimPlugins = [ pkgs.vimPlugins.molokai ];
}
