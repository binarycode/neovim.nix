{ pkgs, ... }: {
  # https://github.com/editorconfig/editorconfig-vim
  # support for https://editorconfig.org standard

  neovimPlugins = [ pkgs.vimPlugins.editorconfig-vim ];
}
