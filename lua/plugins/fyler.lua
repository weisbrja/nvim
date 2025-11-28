return {
	"A7Lavinraj/fyler.nvim",
	dependencies = { "nvim-mini/mini.icons", "folke/snacks.nvim" },
	branch = "stable",
	lazy = false, -- necessary for `default_explorer` to work properly
	keys = {
		{
			"<Leader>o",
			function()
				local fyler = require("fyler")
				fyler.open({ kind = "split_left" })
				fyler.focus()
			end,
			"Open Fyler",
		},
	},
	opts = {
		hooks = {
			on_rename = function(src_path, destination_path)
				Snacks.rename.on_rename_file(src_path, destination_path)
			end,
		},
		views = {
			finder = {
				default_explorer = true,
				close_on_select = false,
				confirm_simple = true,
				mappings = {
					["q"] = "CloseView",
					["<CR>"] = "Select",
					["<C-t>"] = "SelectTab",
					['"'] = "SelectVSplit",
					['%'] = "SelectSplit",
					["-"] = "GotoParent",
					["="] = "GotoCwd",
					["."] = "GotoNode",
					["#"] = "CollapseAll",
					["<BS>"] = "CollapseNode",
					-- <C-o> is annoying
					["<C-o>"] = function() end,
				},
			},
		},
	},
}
