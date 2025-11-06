return {
	"echasnovski/mini.nvim",
	lazy = true,
	event = "InsertEnter",
	config = function()
		require("mini.comment").setup()
		require("mini.trailspace").setup()
		require("mini.ai").setup()
	end,
}
