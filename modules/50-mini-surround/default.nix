{pkgs, ...}: {
  plugin = pkgs.vimPlugins.mini-surround;
  config = builtins.readFile ./config.lua;
}
