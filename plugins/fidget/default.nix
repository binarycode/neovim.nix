{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.fidget-nvim;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
