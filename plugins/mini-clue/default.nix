{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.mini-clue
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
