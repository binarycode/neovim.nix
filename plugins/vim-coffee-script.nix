{ pkgs, ... }: {
  # https://github.com/kchmck/vim-coffee-script
  # coffeescript support

  my.neovimPlugins = [ pkgs.vimPlugins.vim-coffee-script ];
}
