{pkgs, ...}: {
  plugin = pkgs.vimPlugins.mini-basics;
  config = builtins.readFile ./config.lua;
}
