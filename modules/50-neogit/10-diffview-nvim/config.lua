if not vim.g.vscode then
  vim.cmd.packadd("diffview.nvim")

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
end
