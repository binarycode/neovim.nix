{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.fzf-lua;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
