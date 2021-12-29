{ pkgs, ... }: {
  # https://github.com/ms-jpq/chadtree
  # file manager

  my.neovimPlugins = [
    (pkgs.vimPlugins.chadtree.overrideAttrs (_: {
      buildInputs = [ pkgs.python3 ];
      buildPhase = ''
        python3 -m chadtree deps --nvim --xdg
      '';
    }))
  ];
}
