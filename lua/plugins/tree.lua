return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = true,
	-- keys = { { "<Leader>t", vim.cmd.NvimTreeFocus } },
	cmd = { "NvimTreeFocus", "NvimTreeToggle" },
	opts = {
		sync_root_with_cwd = true,
		hijack_cursor = true,
		renderer = {
			icons = {
				symlink_arrow = " -> ",
				show = { git = false },
			},
		},
		filters = { enable = false },
	},
	config = true,
}
