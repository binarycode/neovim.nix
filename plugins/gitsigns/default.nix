{pkgs, ...}: {
  plugins.gitsigns = {
    enable = true;
    lazyLoad.settings.lazy = true;
    settings = {
      numhl = true;
      signcolumn = false;
    };
  };
  extraPlugins = [
    {
      plugin = pkgs.vimPlugins.gitsigns-nvim;
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
