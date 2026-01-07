{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.lualine-nvim;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
