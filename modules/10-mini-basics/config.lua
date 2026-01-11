do
  vim.cmd.packadd("mini.basics")

  require("mini.basics").setup({
    options = {
      extra_ui = true,
    },
    mappings = {
      option_toggle_prefix = "",
    },
  })
end
