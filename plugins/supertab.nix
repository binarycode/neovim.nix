{ pkgs, ... }: {
  # https://github.com/ervandew/supertab
  # use <tab> for completion

  neovimPlugins = [ pkgs.vimPlugins.supertab ];
}
