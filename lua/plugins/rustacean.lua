return {
	"mrcjkb/rustaceanvim",
	lazy = false,
	config = function()
		vim.g.rustaceanvim = {
			server = {
				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = { enable = true },
						},
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						checkOnSave = true,
						diagnostics = {
							enable = true,
						},
						procMacro = { enable = true },
						-- completion = { callable = { snippets = "none" } },
					},
				},
			},
		}
	end,
}
