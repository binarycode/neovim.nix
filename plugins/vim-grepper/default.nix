{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.vim-grepper;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
