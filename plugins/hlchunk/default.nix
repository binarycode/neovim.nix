{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.hlchunk-nvim
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
