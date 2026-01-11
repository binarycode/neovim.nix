{pkgs, ...}: {
  plugin = pkgs.vimPlugins.barbar-nvim;
  config = builtins.readFile ./config.lua;
}
