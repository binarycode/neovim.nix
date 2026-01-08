do
  vim.cmd.packadd("bufferline.nvim")

  require("bufferline").setup({
    options = {
      mode = "tabs",
      separator_style = "thin",
      show_buffer_icons = false,
      show_buffer_close_icons = false,
      show_duplicate_prefix = false,
    },
  })
end
