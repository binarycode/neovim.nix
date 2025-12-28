do
  require("monokai").setup({
    palette = {
      base2 = "#000000",
    },
    italics = false,
    custom_hlgroups = {
      ["@variable.parameter"] = { fg = "#fd971f" },
      ["@variable.member"] = { fg = "#fd971f" },
    },
  })
end
