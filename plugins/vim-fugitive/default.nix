{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.vim-fugitive;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
