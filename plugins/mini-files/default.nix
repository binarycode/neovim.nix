{
  plugins.mini-files.enable = true;

  extraConfigLua = builtins.readFile ./config.lua;
}
