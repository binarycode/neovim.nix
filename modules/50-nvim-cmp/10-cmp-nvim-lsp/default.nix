{pkgs, ...}: {
  plugin = pkgs.vimPlugins.cmp-nvim-lsp;
  config = builtins.readFile ./config.lua;
}
