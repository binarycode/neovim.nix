do
  vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")

  -- move between visible windows
  vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
end
