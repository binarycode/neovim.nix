{ pkgs, ... }: {
  # https://github.com/editorconfig/editorconfig-vim
  # support for https://editorconfig.org standard

  my.neovimPlugins = [ pkgs.vimPlugins.editorconfig-vim ];
}
