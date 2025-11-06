return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		opts = {
			ensure_installed = "all",
			ignore_install = { "ipkg" },
			sync_install = false,
			auto_install = true,
			-- indent = { enable = true },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter").setup(opts)
		end,
	},
	{ "calops/hmts.nvim", version = "*" },
}
