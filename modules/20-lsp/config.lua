if not vim.g.vscode then
  vim.diagnostic.config({
    virtual_text = true,
  })

  vim.lsp.enable({
    "bashls",
    "jsonls",
    "lua_ls",
    "marksman",
    "nil_ls",
    "rust_analyzer",
    "taplo",
    "yamlls",
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
      local buffer = event.buf

      vim.keymap.set("n", "<Leader>la", vim.lsp.buf.code_action, {
        buffer = buffer,
        desc = "Code action",
      })

      vim.keymap.set("n", "<Leader>ln", vim.lsp.buf.rename, {
        buffer = buffer,
        desc = "Rename symbol",
      })
    end,
  })
end
