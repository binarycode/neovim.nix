{ pkgs, ... }: {
  # https://github.com/ervandew/supertab
  # use <tab> for completion

  my.neovimPlugins = [ pkgs.vimPlugins.supertab ];
}
