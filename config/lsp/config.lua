if not vim.g.vscode then
  vim.diagnostic.config({
    virtual_text = true,
  })

  vim.lsp.enable({
    "bash_ls",
    "jsonls",
    "lua_ls",
    "marksman",
    "nil_ls",
    "taplo",
    "yamlls",
  })
end
