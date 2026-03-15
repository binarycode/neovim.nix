do
  vim.cmd.packadd("flash.nvim")

  local plugin = require("flash")

  plugin.setup({
    jump = {
      autojump = true,
    },
  })

  ---@class Flash.Match.TwoLabel: Flash.Match
  ---@field label1 string
  ---@field label2 string

  ---@param opts Flash.Format
  local function format(opts)
    ---@cast opts {match: Flash.Match.TwoLabel}
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
          ---@param matches Flash.Match.TwoLabel[]
          labeler = function(matches)
            for _, m in ipairs(matches) do
              m.label = m.label2
            end
          end,
        })
      end,
      ---@param matches Flash.Match.TwoLabel[]
      labeler = function(matches, state)
        local labels = state:labels()
        for m, match in ipairs(matches) do
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
