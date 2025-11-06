local leader = "<Space>"
local localleader = "<Space><Space>"
vim.g.mapleader = vim.api.nvim_replace_termcodes(leader, true, true, true)
vim.g.maplocalleader = vim.api.nvim_replace_termcodes(localleader, true, true, true)

vim.keymap.set("", leader, "<NOP>")
vim.keymap.set("", localleader, "<NOP>")
