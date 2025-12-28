do
  local hlslens = require("hlslens")

  hlslens.setup()

  local function wrap(key)
    return function()
      vim.cmd.normal({ args = { vim.v.count1 .. key }, bang = true })
      hlslens.start()
    end
  end

  local motions = { "n", "N", "*", "#", "g*", "g#" }
  for _, key in ipairs(motions) do
    vim.keymap.set("n", key, wrap(key), { silent = true, noremap = true })
  end
end
