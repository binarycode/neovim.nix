{pkgs, ...}: {
  plugins.leap.enable = true;

  extraConfigLua = builtins.readFile ./config.lua;
}
