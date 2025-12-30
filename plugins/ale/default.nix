{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.ale;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
