if not vim.g.vscode then
  vim.cmd.packadd("gitsigns.nvim")

  vim.schedule(function()
    require("gitsigns").setup({
      numhl = true,
      signcolumn = false,
    })
  end)
end
