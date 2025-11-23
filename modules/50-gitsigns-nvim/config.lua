if not vim.g.vscode then
  vim.cmd.packadd("gitsigns.nvim")

  local plugin = require("gitsigns")

  plugin.setup({
    on_attach = function(buffer)
      vim.keymap.set("n", "]h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          plugin.nav_hunk("next")
        end
      end, {
        buffer = buffer,
        desc = "Go to next hunk",
      })

      vim.keymap.set("n", "[h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          plugin.nav_hunk("prev")
        end
      end, {
        buffer = buffer,
        desc = "Go to previous hunk",
      })

      vim.keymap.set("n", "<Leader>ghs", plugin.stage_hunk, {
        buffer = buffer,
        desc = "Stage hunk",
      })

      vim.keymap.set("n", "<Leader>ghr", plugin.reset_hunk, {
        buffer = buffer,
        desc = "Reset hunk",
      })

      vim.keymap.set("v", "<Leader>ghs", function()
        plugin.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, {
        buffer = buffer,
        desc = "Stage hunk",
      })

      vim.keymap.set("v", "<Leader>ghr", function()
        plugin.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, {
        buffer = buffer,
        desc = "Reset hunk",
      })

      vim.keymap.set("n", "<Leader>ghp", plugin.preview_hunk, {
        buffer = buffer,
        desc = "Preview hunk",
      })

      vim.keymap.set("n", "<Leader>ghb", function()
        plugin.blame_line({ full = true })
      end, {
        buffer = buffer,
        desc = "Blame line",
      })

      vim.keymap.set("n", "<Leader>ghB", plugin.toggle_current_line_blame, {
        buffer = buffer,
        desc = "Toggle line blame",
      })
    end,
  })
end
