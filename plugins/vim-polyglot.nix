{ pkgs, ... }: {
  # https://github.com/sheerun/vim-polyglot
  # collection of language packs

  my.neovimPlugins = [ pkgs.vimPlugins.vim-polyglot ];
}
