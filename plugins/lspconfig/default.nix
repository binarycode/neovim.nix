{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.nvim-lspconfig;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
