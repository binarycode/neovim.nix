-- move to char
vim.keymap.set('', '<Leader>f', ':HopChar1<CR>')
vim.keymap.set('n', '<Leader>f', ':HopChar1<CR>')
vim.keymap.set('v', '<Leader>f', '<CMD>HopChar1<CR>')

-- move to word
vim.keymap.set('', '<Leader>w', ':HopWord<CR>')
vim.keymap.set('n', '<Leader>w', ':HopWord<CR>')
vim.keymap.set('v', '<Leader>w', '<CMD>HopWord<CR>')

-- move to line
vim.keymap.set('', '<Leader>l', ':HopLine<CR>')
vim.keymap.set('n', '<Leader>l', ':HopLine<CR>')
vim.keymap.set('v', '<Leader>l', '<CMD>HopLine<CR>')

require('hop').setup()
