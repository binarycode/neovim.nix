if not vim.g.vscode then
  vim.cmd.packadd("neoscroll.nvim")

  require('neoscroll').setup()
end
