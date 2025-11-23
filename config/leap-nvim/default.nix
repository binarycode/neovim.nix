{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.leap-nvim];

  extraConfigLua = builtins.readFile ./config.lua;
}
