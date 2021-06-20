{ pkgs, ... }: {
  # https://github.com/tpope/vim-eunuch
  # shortcuts for unix shell commands

  neovimPlugins = [ pkgs.vimPlugins.vim-eunuch ];
}
