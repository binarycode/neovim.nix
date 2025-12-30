{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.vim-eunuch;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
