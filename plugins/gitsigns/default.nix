{
  plugins.gitsigns = {
    enable = true;
    lazyLoad.settings.lazy = true;
    settings = {
      numhl = true;
      signcolumn = false;
    };
  };

  extraConfigLua = builtins.readFile ./config.lua;
}
