{pkgs, ...}: {
  config = builtins.readFile ./config.lua;
  plugin = pkgs.vimPlugins.diffview-nvim;
}
