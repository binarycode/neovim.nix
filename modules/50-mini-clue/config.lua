do
  vim.cmd.packadd("mini.clue")

  local plugin = require("mini.clue")

  plugin.setup({
    triggers = {
      { mode = "n", keys = "<Leader>" },
      { mode = "x", keys = "<Leader>" },
      { mode = "n", keys = "[" },
      { mode = "n", keys = "]" },
      { mode = "i", keys = "<C-x>" },
      { mode = "n", keys = "g" },
      { mode = "x", keys = "g" },
      { mode = "n", keys = "'" },
      { mode = "x", keys = "'" },
      { mode = "n", keys = "`" },
      { mode = "x", keys = "`" },
      { mode = "n", keys = '"' },
      { mode = "x", keys = '"' },
      { mode = "i", keys = "<C-r>" },
      { mode = "c", keys = "<C-r>" },
      { mode = "n", keys = "<C-w>" },
      { mode = "n", keys = "z" },
      { mode = "x", keys = "z" },
    },
    clues = {
      plugin.gen_clues.square_brackets(),
      plugin.gen_clues.builtin_completion(),
      plugin.gen_clues.g(),
      plugin.gen_clues.marks(),
      plugin.gen_clues.registers(),
      plugin.gen_clues.windows(),
      plugin.gen_clues.z(),
    },
    window = {
      config = {
        width = "auto",
      },
    },
  })
end
