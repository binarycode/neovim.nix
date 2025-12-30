if not vim.g.vscode then
  vim.cmd.packadd("filebeagle")

  vim.g.filebeagle_show_hidden = 1

  -- disable default keymappings
  vim.g.filebeagle_suppress_keymaps = 1

  -- open filebeagle
  vim.keymap.set("n", "-", "<Plug>FileBeagleOpenCurrentBufferDir", { silent = true })
end
