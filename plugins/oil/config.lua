if not vim.g.vscode then
  vim.cmd.packadd("oil.nvim")

  vim.schedule(function()
    local oil = require("oil")

    oil.setup({
      columns = {},
    })

    vim.keymap.set("n", "-", oil.open)
  end)
end
