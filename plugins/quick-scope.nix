{ pkgs, ... }: {
  # https://github.com/unblevable/quick-scope
  # highlight unique chars on current line for quicker f, F, t, T motions

  neovimPlugins = [ pkgs.vimPlugins.quick-scope ];
}
