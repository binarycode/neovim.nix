do
  vim.cmd.packadd("nvim-treesitter")

  local plugin = require("nvim-treesitter.configs")

  plugin.setup({
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  })
end
