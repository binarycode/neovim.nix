if not vim.g.vscode then
  require("lz.n").trigger_load("telescope.nvim")

  vim.schedule(function()
    local action_state = require("telescope.actions.state")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    local live_grep_dir = function(find_command)
      builtin.find_files({
        prompt_title = "Select directory to search",
        previewer = false,
        find_command = find_command,
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)

            local selection = action_state.get_selected_entry()
            builtin.live_grep({
              search_dirs = { selection.value },
              prompt_title = "Live Grep in: " .. selection.value,
            })
          end)
          return true
        end,
      })
    end

    vim.keymap.set("n", "<leader>ggr", function()
      local find_command = {
        "git",
        "ls-tree",
        "-d",
        "-r",
        "--name-only",
        "HEAD",
      }
      live_grep_dir(find_command)
    end, { noremap = true, silent = true })

    vim.keymap.set("n", "<leader>gggr", function()
      local find_command = {
        "fd",
        "--unrestricted",
        "--type",
        "d",
        "--color",
        "never",
      }
      live_grep_dir(find_command)
    end, { noremap = true, silent = true })
  end)
end
