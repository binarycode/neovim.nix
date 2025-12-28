{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.ale];

  extraConfigLua = builtins.readFile ./config.lua;
}
