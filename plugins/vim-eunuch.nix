{ pkgs, ... }: {
  # https://github.com/tpope/vim-eunuch
  # shortcuts for unix shell commands

  my.neovimPlugins = [ pkgs.vimPlugins.vim-eunuch ];
}
