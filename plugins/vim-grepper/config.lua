do
  vim.cmd.packadd("vim-grepper")

  vim.keymap.set("n", "<Leader>gr", ":GrepperRg<Space>", { noremap = true, silent = true })

  vim.g.grepper = {
    tools = { "rg" },
    rg = {
      grepprg = "rg -H --no-heading --vimgrep --sort-files",
    },
  }
end
