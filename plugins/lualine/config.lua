if not vim.g.vscode then
  vim.cmd.packadd("lualine.nvim")

  require("lualine").setup({
    options = {
      icons_enabled = false,
      theme = "molokai",
      section_separators = "",
      component_separators = "",
    },
  })
end
