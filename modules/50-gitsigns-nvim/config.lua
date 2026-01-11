if not vim.g.vscode then
  vim.cmd.packadd("gitsigns.nvim")

  require("gitsigns").setup()
end
