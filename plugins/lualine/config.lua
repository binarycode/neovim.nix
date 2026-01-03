if not vim.g.vscode then
  vim.cmd.packadd("lualine.nvim")

  require("lualine").setup()
end
