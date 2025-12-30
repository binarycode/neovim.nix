{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.supertab;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
