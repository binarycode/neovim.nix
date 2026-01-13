do
  vim.keymap.set("n", "<Leader>tk", "<Cmd>tabnext<CR>", {
    silent = true,
    desc = "Switch to next tab",
  })

  vim.keymap.set("n", "<Leader>tj", "<Cmd>tabprev<CR>", {
    silent = true,
    desc = "Switch to previous tab",
  })

  vim.keymap.set("n", "<Leader>td", "<Cmd>tabclose<CR>", {
    silent = true,
    desc = "Delete tab",
  })

  vim.keymap.set("n", "<Leader>tn", "<Cmd>tabnew<CR>", {
    silent = true,
    desc = "New tab",
  })
end
