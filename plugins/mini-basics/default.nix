{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.mini-basics
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
