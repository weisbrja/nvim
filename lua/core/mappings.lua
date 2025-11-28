-- move up and down in wrapped lines
vim.keymap.set({ "n", "v" }, "j", [[v:count == 0 ? "gj" : "j"]], { expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "k", [[v:count == 0 ? "gk" : "k"]], { expr = true, silent = true })

-- toggle spellchecking
-- vim.keymap.set("n", "<Leader>s", ":set spell!<CR>", { silent = true })

-- center
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

-- undo break points
vim.keymap.set("i", ",", ",<C-g>u")
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("i", "!", "!<C-g>u")
vim.keymap.set("i", "?", "?<C-g>u")
vim.keymap.set("i", ":", ":<C-g>u")

-- better tabbing
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- move lines
-- vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv", { silent = true })
-- vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv", { silent = true })

-- disable highlighting search results
vim.keymap.set("n", "//", ":nohlsearch<CR>", { silent = true })

-- TODO: aquire these magic navigation skills
-- navigate quickfix list
-- vim.keymap.set("n", "<Leader>q", vim.cmd.copen)
-- vim.keymap.set("n", "[q", "<Cmd>cnext<CR>zz")
-- vim.keymap.set("n", "]q", "<Cmd>cprev<CR>zz")

-- -- navigate location list
-- vim.keymap.set("n", "<Leader>l", vim.cmd.lopen)
-- vim.keymap.set("n", "[l", "<Cmd>lnext<CR>zz")
-- vim.keymap.set("n", "]l", "<Cmd>lprev<CR>zz")

-- splits
vim.keymap.set('n', '<C-w>%', vim.cmd.vsplit, { silent = true })
vim.keymap.set('n', '<C-w>"', vim.cmd.split,  { silent = true })

-- clipboard
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "c", '"_c')

-- visually select changed text
vim.keymap.set("n", "gV", [["`[" . strpart(getregtype(), 0, 1) . "`]"]], { expr = true, replace_keycodes = false })

vim.keymap.set("n", "<Leader>c", "gcc", { remap = true })
vim.keymap.set("v", "<Leader>c", "gc", { remap = true })
