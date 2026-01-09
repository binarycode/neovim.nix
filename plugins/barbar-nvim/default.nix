{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.barbar-nvim;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
