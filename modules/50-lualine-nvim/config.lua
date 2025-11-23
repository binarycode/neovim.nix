if not vim.g.vscode then
  vim.cmd.packadd("lualine.nvim")

  require("lualine").setup({
    options = {
      icons_enabled = false,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    },
  })
end
