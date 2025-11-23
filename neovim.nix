{
  inputs,
  pkgs,
}: let
  modules =
    builtins.map (path: import path {inherit pkgs inputs;})
    (pkgs.lib.filter (path: builtins.baseNameOf path == "default.nix")
      (pkgs.lib.filesystem.listFilesRecursive ./modules));

  extraPackages = pkgs.lib.flatten (pkgs.lib.catAttrs "extraPackages" modules);

  luaRcContent = builtins.concatStringsSep "\n\n" (pkgs.lib.catAttrs "config" modules);

  plugins = pkgs.lib.map (plugin: {
    plugin = plugin;
    optional = true;
  }) (pkgs.lib.catAttrs "plugin" modules);
in
  pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
    inherit extraPackages luaRcContent plugins;
  }
