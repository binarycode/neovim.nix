{pkgs, ...}: {
  plugin = pkgs.vimPlugins.neoscroll-nvim;
  config = builtins.readFile ./config.lua;
}
