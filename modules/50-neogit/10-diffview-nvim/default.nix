{pkgs, ...}: {
  plugin = pkgs.vimPlugins.diffview-nvim;
  config = builtins.readFile ./config.lua;
}
