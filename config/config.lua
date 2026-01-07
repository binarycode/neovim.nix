do
  -- replace tabs with spaces
  vim.opt.expandtab = true

  -- number of spaces for each indent step
  vim.opt.shiftwidth = 2

  -- tab size for editing operations (like <Tab> and <BS>)
  vim.opt.softtabstop = 2

  -- editing operations use softtabstop value
  vim.opt.smarttab = true

  -- cursor line stays centered
  vim.opt.scrolloff = 999

  -- single statusline for all windows
  vim.opt.laststatus = 3

  -- use clipboard for all operations
  vim.opt.clipboard:append("unnamedplus")

  -- always use vertical diffs
  vim.opt.diffopt:append("vertical")

  -- hide search highlight on escape
  vim.keymap.set("n", "<Esc>", vim.cmd.nohlsearch, { silent = true })

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
      "taplo",
      "yamlls",
    })
  end
end
