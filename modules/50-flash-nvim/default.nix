{pkgs, ...}: {
  plugin = pkgs.vimPlugins.flash-nvim;
  config = builtins.readFile ./config.lua;
}
