vim.o.termguicolors = true
vim.o.background = "dark"

vim.o.clipboard = "unnamedplus"

vim.opt.spelllang = { "en_us", "de_20" }

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.inccommand = "nosplit"

vim.o.scrolloff = 8

vim.o.mouse = "a"

vim.o.virtualedit = "block"

vim.o.showmode = false

vim.o.shortmess = "aoOTFI"

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.linebreak = true

-- number column
vim.o.number = true
vim.o.signcolumn = "number"

vim.o.title = true

vim.g.man_hardwrap = false

vim.o.pumheight = 5

vim.opt.undofile = true

vim.opt.completeopt = { "menuone", "noselect", "noinsert" }

vim.o.confirm = true

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- local disabled_builtins = {
-- 	"netrw",
-- 	"netrwPlugin",
-- 	"netrwSettings",
-- 	"netrwFileHandlers",
-- 	"gzip",
-- 	"zip",
-- 	"zipPlugin",
-- 	"tar",
-- 	"tarPlugin",
-- 	"getscript",
-- 	"getscriptPlugin",
-- 	"vimball",
-- 	"vimballPlugin",
-- 	"2html_plugin",
-- 	"logipat",
-- 	"rrhelper",
-- 	"spellfile_plugin",
-- 	"matchit",
-- }
--
-- for _, plugin in pairs(disabled_builtins) do
-- 	vim.g["loaded_" .. plugin] = 1
-- end
