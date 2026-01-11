{pkgs, ...}: {
  plugin = pkgs.vimPlugins.mini-trailspace;
  config = builtins.readFile ./config.lua;
}
