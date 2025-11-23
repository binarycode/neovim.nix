{pkgs, ...}: {
  config = builtins.readFile ./config.lua;
  extraPackages = [pkgs.fd];
  plugin = pkgs.vimPlugins.fzf-lua;
}
