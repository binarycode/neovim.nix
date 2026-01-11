do
  vim.cmd.packadd("barbar.nvim")

  vim.keymap.set("n", "<Leader>tk", "<Cmd>BufferNext<CR>", {
    silent = true,
    desc = "Switch to next buffer",
  })

  vim.keymap.set("n", "<Leader>tj", "<Cmd>BufferPrevious<CR>", {
    silent = true,
    desc = "Switch to previous buffer",
  })

  vim.keymap.set("n", "<Leader>td", "<Cmd>BufferClose<CR>", {
    silent = true,
    desc = "Delete buffer",
  })

  vim.keymap.set("n", "<Leader>tp", "<Cmd>BufferPin<CR>", {
    silent = true,
    desc = "Pin buffer",
  })

  vim.keymap.set("n", "<Leader>tt", "<Cmd>BufferPick<CR>", {
    silent = true,
    desc = "Jump to buffer",
  })

  vim.keymap.set("n", "<Leader>bs0", "<Cmd>BufferOrderByBufferNumber<CR>", {
    silent = true,
    desc = "Order buffers by number",
  })

  vim.keymap.set("n", "<Leader>bs1", "<Cmd>BufferOrderByName<CR>", {
    silent = true,
    desc = "Order buffers by name",
  })

  vim.keymap.set("n", "<Leader>bs2", "<Cmd>BufferOrderByDirectory<CR>", {
    silent = true,
    desc = "Order buffers by directory",
  })

  vim.keymap.set("n", "<Leader>bs3", "<Cmd>BufferOrderByLanguage<CR>", {
    silent = true,
    desc = "Order buffers by language",
  })

  vim.keymap.set("n", "<Leader>bs4", "<Cmd>BufferOrderByWindowNumber<CR>", {
    silent = true,
    desc = "Order buffers by window number",
  })
end
