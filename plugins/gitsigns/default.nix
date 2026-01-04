{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.gitsigns-nvim;
      optional = true;
    }
  ];

  extraPackages = [pkgs.git];

  extraConfigLua = builtins.readFile ./config.lua;
}
