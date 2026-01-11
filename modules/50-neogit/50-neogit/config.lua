if not vim.g.vscode then
  vim.cmd.packadd("neogit")

  local plugin = require("neogit")

  vim.keymap.set("n", "<Leader>z", plugin.open, {
    silent = true,
    desc = "Neogit",
  })
end
