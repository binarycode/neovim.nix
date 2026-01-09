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
    {
      plugin = pkgs.vimPlugins.cmp_luasnip;
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.luasnip;
      optional = true;
    }
    {
      plugin = pkgs.vimPlugins.friendly-snippets;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
