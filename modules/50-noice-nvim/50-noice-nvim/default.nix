{pkgs, ...}: {
  plugin = pkgs.vimPlugins.noice-nvim;
  config = builtins.readFile ./config.lua;
}
