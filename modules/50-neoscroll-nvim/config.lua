if not vim.g.vscode then
  vim.cmd.packadd("neoscroll.nvim")

  local plugin = require("neoscroll")

  plugin.setup()

  vim.keymap.set("n", "<C-j>", function()
    plugin.ctrl_f({ duration = 200 })
  end, { silent = true })
  vim.keymap.set("n", "<C-k>", function()
    plugin.ctrl_b({ duration = 200 })
  end, { silent = true })
end
