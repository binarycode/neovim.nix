do
  vim.keymap.set("n", "<Leader>tk", vim.cmd.tabnext, {
    silent = true,
    desc = "Switch to next tab",
  })
  vim.keymap.set("n", "<Leader>tj", vim.cmd.tabprev, {
    silent = true,
    desc = "Switch to previous tab",
  })
  vim.keymap.set("n", "<Leader>tn", vim.cmd.tabnew, {
    silent = true,
    desc = "Create new tab",
  })
  vim.keymap.set("n", "<Leader>td", vim.cmd.tabclose, {
    silent = true,
    desc = "Delete tab",
  })
end
