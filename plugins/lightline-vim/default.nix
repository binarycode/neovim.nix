{
  plugins.lightline = {
    enable = true;
    lazyLoad.settings.lazy = true;
  };

  extraConfigLua = builtins.readFile ./config.lua;
}
