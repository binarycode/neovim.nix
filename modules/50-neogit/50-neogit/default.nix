{pkgs, ...}: {
  plugin = pkgs.vimPlugins.neogit;
  config = builtins.readFile ./config.lua;
}
