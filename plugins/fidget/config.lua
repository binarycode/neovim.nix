if not vim.g.vscode then
  vim.cmd.packadd("fidget.nvim")

  require("fidget").setup({})
end
