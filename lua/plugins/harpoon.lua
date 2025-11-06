return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<C-h>",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			"",
		},
		{
			"<Leader>h",
			function()
				require("harpoon"):list():add()
			end,
		},
		{
			"<Leader>p",
			function()
				require("harpoon"):list():prev()
			end,
			"",
		},
		{
			"<Leader>n",
			function()
				require("harpoon"):list():next()
			end,
			"",
		},
		{
			"<Leader>1",
			function()
				require("harpoon"):list():select(1)
			end,
		},
		{
			"<Leader>2",
			function()
				require("harpoon"):list():select(2)
			end,
		},
		{
			"<Leader>3",
			function()
				require("harpoon"):list():select(3)
			end,
		},
		{
			"<Leader>4",
			function()
				require("harpoon"):list():select(4)
			end,
		},
	},
	opts = { settings = { sync_on_ui_close = true } },
}
