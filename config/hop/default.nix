{
  plugins.hop.enable = true;

  extraConfigLua = builtins.readFile ./config.lua;
}
