pkgs: {
  config = builtins.readFile ./config.vim;
  raw = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
}
