do
  vim.keymap.set("n", "<Leader>tk", vim.cmd.tabnext, { silent = true })
  vim.keymap.set("n", "<Leader>tj", vim.cmd.tabprev, { silent = true })
  vim.keymap.set("n", "<Leader>tn", vim.cmd.tabnew, { silent = true })
  vim.keymap.set("n", "<Leader>td", vim.cmd.tabclose, { silent = true })
end
