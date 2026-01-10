if not vim.g.vscode then
  vim.cmd.packadd("diffview.nvim")
  vim.cmd.packadd("neogit")

  local neogit = require("neogit")

  vim.keymap.set("n", "<Leader>z", neogit.open, {
    silent = true,
    desc = "Neogit",
  })
end
