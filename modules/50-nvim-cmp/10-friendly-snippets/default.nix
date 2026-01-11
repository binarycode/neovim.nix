{pkgs, ...}: {
  plugin = pkgs.vimPlugins.friendly-snippets;
  config = builtins.readFile ./config.lua;
}
