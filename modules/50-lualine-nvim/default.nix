{pkgs, ...}: {
  plugin = pkgs.vimPlugins.lualine-nvim;
  config = builtins.readFile ./config.lua;
}
