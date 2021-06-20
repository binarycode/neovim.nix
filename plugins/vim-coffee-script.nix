{ pkgs, ... }: {
  # https://github.com/kchmck/vim-coffee-script
  # coffeescript support

  neovimPlugins = [ pkgs.vimPlugins.vim-coffee-script ];
}
