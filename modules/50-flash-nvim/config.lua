do
  vim.cmd.packadd("flash.nvim")

  local plugin = require("flash")

  plugin.setup({
    jump = {
      autojump = true,
    },
  })

  local function format(opts)
    ---@cast opts {match: {label1: string, label2: string}}
    return {
      { opts.match.label1, "FlashMatch" },
      { opts.match.label2, "FlashLabel" },
    }
  end

  local function two_label_jump(opts)
    plugin.jump(vim.tbl_deep_extend("force", {
      label = { uppercase = false, format = format },
      action = function(match, state)
        state:hide()
        plugin.jump({
          search = { max_length = 0 },
          highlight = { matches = false },
          label = { format = format },
          matcher = function(win)
            return vim.tbl_filter(function(m)
              return m.label == match.label and m.win == win
            end, state.results)
          end,
          labeler = function(matches)
            for _, m in ipairs(matches) do
              ---@cast m {label: string|false, label2: string}
              m.label = m.label2
            end
          end,
        })
      end,
      labeler = function(matches, state)
        local labels = state:labels()
        for m, match in ipairs(matches) do
          ---@cast match {label: string|false, label1: string, label2: string}
          match.label1 = labels[math.floor((m - 1) / #labels) + 1]
          match.label2 = labels[(m - 1) % #labels + 1]
          match.label = match.label1
        end
      end,
    }, opts))
  end

  vim.keymap.set({ "n", "x", "o" }, "s", plugin.jump, {
    silent = true,
    desc = "Jump",
  })

  vim.keymap.set({ "n", "x", "o" }, "<Leader>jw", function()
    two_label_jump({
      search = { mode = "search" },
      label = { after = false, before = { 0, 0 } },
      pattern = [[\<]],
    })
  end, {
    silent = true,
    desc = "Jump to word",
  })

  vim.keymap.set({ "n", "x", "o" }, "<Leader>jl", function()
    two_label_jump({
      search = { mode = "search", max_length = 0 },
      label = { after = { 0, 0 } },
      pattern = "^",
    })
  end, {
    silent = true,
    desc = "Jump to line",
  })

  vim.keymap.set("o", "r", plugin.remote, {
    silent = true,
    desc = "Remote Flash",
  })

  vim.keymap.set({ "o", "x" }, "R", plugin.treesitter_search, {
    silent = true,
    desc = "Treesitter Search",
  })
end
