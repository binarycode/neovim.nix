{pkgs, ...}: {
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.nvim-cmp;
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.cmp-nvim-lsp;
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.cmp-buffer;
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.cmp-path;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
