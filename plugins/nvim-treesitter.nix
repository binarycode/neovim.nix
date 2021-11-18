{ pkgs, ... }: {
  # https://github.com/nvim-treesitter/nvim-treesitter
  # treesitter support

  my.neovimPlugins = [ (pkgs.vimPlugins.nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars)) ];
}
