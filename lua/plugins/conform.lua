return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	keys = {
		{
			"<Leader>=",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
		},
	},
	opts = {
		formatters_by_ft = {
			tex = { "latexindent" },
			latex = { "latexindent" },
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
