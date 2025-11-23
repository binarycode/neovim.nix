if not vim.g.vscode then
  vim.cmd.packadd("hlchunk.nvim")

  require("hlchunk").setup({
    chunk = {
      enable = true,
      notify = false,
    },
  })
end
