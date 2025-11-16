return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = function()
		local keys = {
			{
				"<C-h>",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				"Harpoon Quick Menu",
			},
			{
				"<Leader>h",
				function()
					require("harpoon"):list():add()
				end,
				"Harpoon File"
			},
			{
				"<Leader>p",
				function()
					require("harpoon"):list():prev()
				end,
				"Harpoon to Previous File",
			},
			{
				"<Leader>n",
				function()
					require("harpoon"):list():next()
				end,
				"Harpoon to Next File",
			},
		}
		for i = 1, 5 do
			table.insert(keys, {
				"<Leader>" .. i,
				function()
					require("harpoon"):list():select(i)
				end,
				desc = "Harpoon to File " .. i,
			})
		end
		return keys
	end,
	opts = { settings = { sync_on_ui_close = true } },
}
