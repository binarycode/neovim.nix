do
  local flash = require("flash")

  flash.setup({})

  vim.keymap.set({ "n", "x", "o" }, "<Leader>s", function()
    flash.jump()
  end)

  vim.keymap.set({ "n", "x", "o" }, "<Leader>l", function()
    flash.jump({
      search = { mode = "search", max_length = 0 },
      label = { after = { 0, 0 } },
      pattern = "^",
    })
  end)

  vim.keymap.set({ "n", "x", "o" }, "S", function()
    flash.treesitter()
  end)

  vim.keymap.set("o", "r", function()
    flash.remote()
  end)

  vim.keymap.set({ "o", "x" }, "R", function()
    flash.treesitter_search()
  end)

  vim.keymap.set("c", "<c-s>", function()
    flash.toggle()
  end)
end
