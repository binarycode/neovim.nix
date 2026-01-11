{pkgs, ...}: {
  plugin = pkgs.vimPlugins.nui-nvim;
  config = builtins.readFile ./config.lua;
}
