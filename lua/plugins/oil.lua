return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
	},
	keys = { { "<Leader>o", vim.cmd.Oil } },
	cmd = "Oil",
	config = function(_, opts)
		require("oil").setup(opts)
		vim.api.nvim_set_hl(0, "OilDirIcon", { link = "NvimTreeFolderIcon" })
	end,
}
