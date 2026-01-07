{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.hlchunk-nvim;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
