if not vim.g.vscode then
  vim.cmd.packadd("luasnip")

  require("luasnip.loaders.from_vscode").lazy_load()
end
