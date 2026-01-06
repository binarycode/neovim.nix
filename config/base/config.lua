do
  -- compact signs
  vim.opt.signcolumn = "number"

  -- replace tabs with spaces
  vim.opt.expandtab = true

  -- number of spaces for each indent step
  vim.opt.shiftwidth = 2

  -- tab size for editing operations (like <Tab> and <BS>)
  vim.opt.softtabstop = 2

  -- editing operations use softtabstop value
  vim.opt.smarttab = true

  -- show line numbers
  vim.opt.number = true

  -- highlight all search matches
  vim.opt.hlsearch = true

  -- incremental search
  vim.opt.incsearch = true

  -- enable modeline
  vim.opt.modeline = true

  -- ignore case in search patterns
  vim.opt.ignorecase = true

  -- override ignorecase if search pattern has upper case characters
  vim.opt.smartcase = true

  -- make whitespace visible
  vim.opt.list = false
  vim.opt.listchars = {
    space = "⋅",
    eol = "↴",
  }

  -- use clipboard for all operations
  vim.opt.clipboard:append("unnamedplus")

  -- make vim work correctly with watch/livereload tools
  vim.opt.backupcopy = "yes"
  vim.opt.backupdir = "/tmp//"
  vim.opt.directory = "/tmp//"

  -- always use vertical diffs
  vim.opt.diffopt:append("vertical")

  -- use spacebar as Leader
  vim.g.mapleader = " "

  -- split navigation
  vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
  vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
  vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
  vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

  -- cursor line stays centered
  vim.opt.scrolloff = 999

  -- statusline always visible
  vim.opt.laststatus = 2

  -- allow backspacing over everything
  vim.opt.backspace = { "indent", "eol", "start" }

  -- hide search highlight on escape
  vim.keymap.set("n", "<Esc>", ":noh<CR><Esc>", { silent = true })

  -- quick page scrolling
  vim.keymap.set({ "n", "v" }, "J", "<PageDown>")
  vim.keymap.set({ "n", "v" }, "K", "<PageUp>")
end
