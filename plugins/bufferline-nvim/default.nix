{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.bufferline-nvim;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
