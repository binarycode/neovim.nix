if not vim.g.vscode then
  vim.cmd.packadd("fzf-lua")

  local plugin = require("fzf-lua")

  vim.keymap.set("n", "<Leader><Leader>", plugin.files, {
    silent = true,
    desc = "Jump to file",
  })

  vim.keymap.set("n", "<Leader>o", function()
    vim.notify("<Leader>o is deprecated", "warn")
    vim.defer_fn(plugin.files, 2000)
  end, {
    silent = true,
    desc = "Jump to file (DEPRECATED)",
  })

  vim.keymap.set("n", "<Leader>gr", plugin.live_grep, {
    silent = true,
    desc = "Search text",
  })

  vim.keymap.set("n", "<Leader>gp", function()
    plugin.fzf_exec("fd --type d --color never", {
      prompt = "Select directory > ",
      actions = {
        ["default"] = function(selected)
          if selected and selected[1] then
            plugin.live_grep({
              cwd = selected[1],
              prompt = "Search in directory: > ",
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
