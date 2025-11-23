if not vim.g.vscode then
  vim.cmd.packadd("nvim-treesitter")

  require("nvim-treesitter.configs").setup({
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  })
end
