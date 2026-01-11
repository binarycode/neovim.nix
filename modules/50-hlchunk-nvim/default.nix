{pkgs, ...}: {
  plugin = pkgs.vimPlugins.hlchunk-nvim;
  config = builtins.readFile ./config.lua;
}
