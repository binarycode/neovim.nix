{pkgs, ...}: {
  plugin = pkgs.vimPlugins.fzf-lua;
  config = builtins.readFile ./config.lua;
}
