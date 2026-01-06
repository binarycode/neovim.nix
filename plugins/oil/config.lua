if not vim.g.vscode then
  vim.cmd.packadd("oil.nvim")

  local oil = require("oil")

  oil.setup({
    keymaps = {
      ["l"] = "actions.select",
      ["<CR>"] = "actions.select",
      ["-"] = { "actions.parent", mode = "n" },
      ["h"] = { "actions.parent", mode = "n" },
      ["<C-c>"] = { "actions.close", mode = "n" },
      ["q"] = { "actions.close", mode = "n" },
      ["g?"] = { "actions.show_help", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    use_default_keymaps = false,
  })

  vim.keymap.set("n", "-", oil.open)
end
