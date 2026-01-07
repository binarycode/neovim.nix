{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.noice-nvim
    pkgs.vimPlugins.nui-nvim
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
