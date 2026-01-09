{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.diffview-nvim;
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.neogit;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
