{pkgs, ...}: {
  config = builtins.readFile ./config.lua;
}
