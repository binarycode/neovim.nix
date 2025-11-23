if not vim.g.vscode then
  vim.cmd.packadd("fzf-lua")

  local plugin = require("fzf-lua")

  plugin.setup({
    actions = {
      files = {
        true, -- inherit defaults
        ["ctrl-q"] = { fn = plugin.actions.file_sel_to_qf, prefix = "select-all+" },
        ["ctrl-l"] = { fn = plugin.actions.file_sel_to_ll, prefix = "select-all+" },
      },
    },
  })

  vim.keymap.set("n", "<Leader><Leader>", plugin.files, {
    silent = true,
    desc = "Jump to file",
  })

  vim.keymap.set("n", "<Leader>fr", plugin.resume, {
    silent = true,
    desc = "Resume last picker",
  })

  vim.keymap.set("n", "<Leader>fgr", plugin.live_grep, {
    silent = true,
    desc = "Search text",
  })

  vim.keymap.set("n", "<Leader>fgp", function()
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

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
      local buffer = event.buf

      vim.keymap.set("n", "<Leader>fld", plugin.lsp_definitions, {
        buffer = buffer,
        desc = "Go to definition",
      })

      vim.keymap.set("n", "<Leader>flr", plugin.lsp_references, {
        buffer = buffer,
        desc = "Go to references",
      })

      vim.keymap.set("n", "<Leader>fls", plugin.lsp_document_symbols, {
        buffer = buffer,
        desc = "Document symbols",
      })

      vim.keymap.set("n", "<Leader>flS", plugin.lsp_workspace_symbols, {
        buffer = buffer,
        desc = "Workspace symbols",
      })
    end,
  })
end
