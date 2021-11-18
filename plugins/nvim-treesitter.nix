{ pkgs, ... }: {
  # https://github.com/nvim-treesitter/nvim-treesitter
  # treesitter support

  my = {
    neovimRC = [
      ''
        lua <<EOF
        require'nvim-treesitter.configs'.setup {
          highlight = { enable = true },
        }
        EOF
      ''
    ];
    neovimPlugins = [ (pkgs.vimPlugins.nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars)) ];
  };
}
