{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.vim-grepper];

  extraConfigLua = builtins.readFile ./config.lua;
}
