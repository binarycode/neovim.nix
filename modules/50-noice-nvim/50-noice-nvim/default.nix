{pkgs, ...}: {
  config = builtins.readFile ./config.lua;
  plugin = pkgs.vimPlugins.noice-nvim;
}
