do
  vim.keymap.set("n", "<Leader>m1", function()
    local path = vim.fn.expand("%:~:.")
    vim.fn.setreg("+", path)
    vim.notify("Copied: " .. path)
  end, {
    silent = true,
    desc = "Copy relative path of current file",
  })

  vim.keymap.set("n", "<Leader>m2", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    vim.notify("Copied: " .. path)
  end, {
    silent = true,
    desc = "Copy absolute path of current file",
  })
end
