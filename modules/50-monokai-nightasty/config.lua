do
  vim.cmd.packadd("monokai-nightasty")

  require("monokai-nightasty").load({
    dark_style_background = "#000000",
    dim_inactive = true,
  })
end
