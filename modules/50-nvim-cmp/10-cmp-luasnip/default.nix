{pkgs, ...}: {
  plugin = pkgs.vimPlugins.cmp_luasnip;
  config = builtins.readFile ./config.lua;
}
