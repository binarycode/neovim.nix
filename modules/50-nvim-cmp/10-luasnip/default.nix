{pkgs, ...}: {
  plugin = pkgs.vimPlugins.luasnip;
  config = builtins.readFile ./config.lua;
}
