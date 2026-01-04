{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.gitsigns-nvim;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
