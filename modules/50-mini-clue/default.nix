{pkgs, ...}: {
  plugin = pkgs.vimPlugins.mini-clue;
  config = builtins.readFile ./config.lua;
}
