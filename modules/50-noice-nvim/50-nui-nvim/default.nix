{pkgs, ...}: {
  config = builtins.readFile ./config.lua;
  plugin = pkgs.vimPlugins.nui-nvim;
}
