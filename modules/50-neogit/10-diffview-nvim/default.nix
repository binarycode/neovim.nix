{pkgs, ...}: {
  config = builtins.readFile ./config.lua;
  extraPackages = [pkgs.git];
  plugin = pkgs.vimPlugins.diffview-nvim;
}
