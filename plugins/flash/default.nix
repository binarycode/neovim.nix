{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.flash-nvim
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
