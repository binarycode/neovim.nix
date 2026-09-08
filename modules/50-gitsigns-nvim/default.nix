{pkgs, ...}: {
  config = builtins.readFile ./config.lua;
  extraPackages = [pkgs.git];
  plugin = pkgs.vimPlugins.gitsigns-nvim;
}
