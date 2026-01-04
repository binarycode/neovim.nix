if not vim.g.vscode then
  vim.cmd.packadd("telescope.nvim")

  vim.schedule(function()
    require("telescope").setup({
      pickers = {
        find_files = {
          disable_devicons = true,
        },
        live_grep = {
          disable_devicons = true,
        },
      },
    })

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

    vim.keymap.set("n", "<Leader>o", builtin.find_files)

    vim.keymap.set("n", "<Leader>gr", builtin.live_grep)

    vim.keymap.set("n", "<Leader>ggr", function()
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

    vim.keymap.set("n", "<Leader>gggr", function()
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
