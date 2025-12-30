{
  plugins.mini-indentscope = {
    enable = true;
    lazyLoad.settings.lazy = true;
  };

  extraConfigLua = builtins.readFile ./config.lua;
}
