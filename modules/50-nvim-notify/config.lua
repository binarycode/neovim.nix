do
  vim.cmd.packadd("nvim-notify")

  require("notify").setup({
    render = "minimal",
  })
end
