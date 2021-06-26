{ pkgs, ... }: {
  # https://github.com/itchyny/lightline.vim
  # statusline/tabline styles

  my.neovimPlugins = [ pkgs.vimPlugins.lightline-vim ];
}
