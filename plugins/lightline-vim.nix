{ pkgs, ... }: {
  # https://github.com/itchyny/lightline.vim
  # statusline/tabline styles

  neovimPlugins = [ pkgs.vimPlugins.lightline-vim ];
}
