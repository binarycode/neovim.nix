do
  local hlslens = require("hlslens")

  hlslens.setup()

  local motions = { "n", "N", "*", "#", "g*", "g#" }
  for _, key in ipairs(motions) do
    vim.keymap.set("n", key, function()
      local ok = pcall(vim.cmd.normal, { args = { vim.v.count1 .. key }, bang = true })
      if ok then
        hlslens.start()
      end
    end, { silent = true, noremap = true })
  end
end
