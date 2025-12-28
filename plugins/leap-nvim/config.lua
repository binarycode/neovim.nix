do
  vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")

  -- move between visible windows
  vim.keymap.set("n", "S", "<Plug>(leap-from-window)")

  -- Use the traversal keys to repeat the previous motion without
  -- explicitly invoking Leap:
  require("leap.user").set_repeat_keys("<enter>", "<backspace>")
end
