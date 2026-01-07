{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.neoscroll-nvim;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
