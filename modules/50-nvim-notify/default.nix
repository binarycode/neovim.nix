{pkgs, ...}: {
  plugin = pkgs.vimPlugins.nvim-notify;
  config = builtins.readFile ./config.lua;
}
