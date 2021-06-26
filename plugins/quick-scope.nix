{ pkgs, ... }: {
  # https://github.com/unblevable/quick-scope
  # highlight unique chars on current line for quicker f, F, t, T motions

  my = {
    neovimPlugins = [ pkgs.vimPlugins.quick-scope ];

    neominPlugins = [ pkgs.vimPlugins.quick-scope ];
  };
}
