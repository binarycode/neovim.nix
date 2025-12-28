do
  local hop = require("hop")
  local directions = require("hop.hint").HintDirection

  -- move to char
  vim.keymap.set("", "f", function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
  end, { remap = true })

  -- move back to char
  vim.keymap.set("", "F", function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
  end, { remap = true })

  -- move until char
  vim.keymap.set("", "t", function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
  end, { remap = true })

  -- move back until char
  vim.keymap.set("", "T", function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
  end, { remap = true })

  -- move to word
  vim.keymap.set("", "<Leader>w", hop.hint_words, { remap = true })

  -- move to line
  vim.keymap.set("", "<Leader>l", hop.hint_lines, { remap = true })

  hop.setup()
end
