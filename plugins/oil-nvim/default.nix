{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.oil-nvim;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
