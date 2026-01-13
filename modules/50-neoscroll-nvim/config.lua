if not vim.g.vscode then
  vim.cmd.packadd("neoscroll.nvim")

  local neoscroll = require("neoscroll")

  neoscroll.setup()

  vim.keymap.set("n", "J", function()
      neoscroll.ctrl_d({ duration = 250 })
  end, { silent = true })
  vim.keymap.set("n", "K", function()
      neoscroll.ctrl_u({ duration = 250 })
  end, { silent = true })
end
