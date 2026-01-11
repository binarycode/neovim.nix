{pkgs, ...}: {
  plugin = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
  config = builtins.readFile ./config.lua;
}
