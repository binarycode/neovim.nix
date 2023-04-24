pkgs: {
  config = builtins.readFile ./config.vim;
  plugins = [ "nvim-treesitter-endwise" ];
  raw = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
}
