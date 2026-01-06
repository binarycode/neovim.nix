if not vim.g.vscode then
  vim.cmd.packadd("fzf-lua")

  local fzf = require("fzf-lua")

  vim.keymap.set("n", "<Leader><Leader>", fzf.files, {
    silent = true,
    desc = "Jump to file",
  })
  vim.keymap.set("n", "<Leader>o", function()
    vim.notify("<Leader>o is deprecated", "warn")
    fzf.files()
  end, {
    silent = true,
    desc = "Jump to file (DEPRECATED)",
  })

  vim.keymap.set("n", "<Leader>gr", fzf.live_grep, {
    silent = true,
    desc = "Search text",
  })

  vim.keymap.set("n", "<Leader>gp", function()
    fzf.fzf_exec("fd --type d --color never", {
      prompt = "Select directory > ",
      actions = {
        ["default"] = function(selected)
          if selected and selected[1] then
            local path = selected[1]
            fzf.live_grep({
              cwd = path,
              prompt = "Search in: " .. path .. " > ",
            })
          end
        end,
      },
    })
  end, {
    silent = true,
    desc = "Search text in selected directory",
  })
end
