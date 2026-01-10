if not vim.g.vscode then
  vim.cmd.packadd("diffview.nvim")
  vim.cmd.packadd("neogit")

  require("diffview").setup({
    keymaps = {
      view = {
        q = "<Cmd>DiffviewClose<CR>",
      },
      file_panel = {
        q = "<Cmd>DiffviewClose<CR>",
      },
      file_history_panel = {
        q = "<Cmd>DiffviewClose<CR>",
      },
    },
    hooks = {
      view_opened = function()
        vim.cmd("DiffviewToggleFiles")
      end,
    },
  })

  local plugin = require("neogit")

  vim.keymap.set("n", "<Leader>z", plugin.open, {
    silent = true,
    desc = "Neogit",
  })
end
