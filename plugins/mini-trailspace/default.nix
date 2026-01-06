{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.mini-trailspace
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
