{pkgs, ...}: {
  plugin = pkgs.vimPlugins.cmp-path;
  config = builtins.readFile ./config.lua;
}
