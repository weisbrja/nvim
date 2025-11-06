-- TODO: quickfix lists and scratch buffers seem very interesting!
-- future me, please have a closer look at this plugin.
return {
	"folke/trouble.nvim",
	lazy = true,
	enabled = true,
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		auto_close = true,
		follow = true,
		focus = true,
	},
	keys = {
		{
			"<Leader>V",
			"<Cmd>Trouble diagnostics open filter.buf=0<CR>",
		},
	},
}
