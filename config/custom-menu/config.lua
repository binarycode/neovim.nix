vim.schedule(function()
  vim.keymap.set("n", "<Leader>m", function()
    vim.ui.select({
      {
        label = "Copy absolute path of current file",
        handler = function()
          local path = vim.fn.expand("%:p")
          vim.fn.setreg("+", path)
          vim.notify("Copied: " .. path)
        end,
      },
      {
        label = "Copy relative path of current file",
        handler = function()
          local path = vim.fn.expand("%:~:.")
          vim.fn.setreg("+", path)
          vim.notify("Copied: " .. path)
        end,
      },
    }, {
      prompt = "Actions: ",
      format_item = function(item)
        return item.label
      end,
    }, function(choice)
      if choice then
        choice.handler()
      end
    end)
  end, { noremap = true })
end)
