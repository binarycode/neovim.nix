{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.nvim-hlslens];

  extraConfigLua = builtins.readFile ./config.lua;
}
