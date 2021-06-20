{ pkgs, ... }: {
  # https://github.com/sheerun/vim-polyglot
  # collection of language packs

  neovimPlugins = [ pkgs.vimPlugins.vim-polyglot ];
}
