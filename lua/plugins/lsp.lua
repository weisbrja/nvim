return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		lazy = true,
		opts = {},
	},
	{
		"whoissethdaniel/mason-tool-installer.nvim",
		cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
		build = ":MasonToolsUpdate",
		lazy = true,
		opts = {
			ensure_installed = {
				-- lsps
				"bash-language-server",
				"clangd",
				"css-lsp",
				"flake8",
				"html-lsp",
				"jdtls",
				"json-lsp",
				"lua-language-server",
				-- "pest-language-server",
				"python-lsp-server",
				"tailwindcss-language-server",
				"texlab",
				"typescript-language-server",
				"zls",
				-- formatters
				"black",
				"prettier",
				"stylua",
				-- linters
				"shellcheck",
			},
			integrations = {
				["mason-lspconfig"] = false,
				["mason-null-ls"] = false,
				["mason-nvim-dap"] = false,
			},
		},
		dependencies = {
			"mason.nvim",
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			-- specific config plugins
			-- "pest-parser/pest.vim",
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			-- vim.diagnostic.config({ underline = false })

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local function map(mode, keys, func)
						vim.keymap.set(mode, keys, func, { buffer = event.buf, remap = false })
					end

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					assert(client, "LSP client not found")

					---@diagnostic disable-next-line: inject-field
					client.server_capabilities.document_formatting = true

					map("n", "K", vim.lsp.buf.hover)
					map("n", "<Leader>x", vim.diagnostic.setqflist)
					map("n", "<Leader>v", vim.diagnostic.open_float)
					map("n", "<Leader>a", vim.lsp.buf.code_action)
					map("n", "<Leader>r", vim.lsp.buf.rename)
					map("i", "<C-k>", vim.lsp.buf.signature_help)
				end,
			})

			vim.lsp.config("cssls", {
				settings = {
					css = {
						lint = {
							unknownAtRules = "ignore",
						},
					},
				},
			})
			vim.lsp.config("pylsp", {
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								maxLineLength = 88,
							},
						},
					},
				},
			})
			-- vim.lsp.config("pest_ls", {
			-- 	require("pest-vim").setup({}),
			-- })
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
					},
				},
			})

			---@diagnostic disable-next-line: missing-fields
			require("mason-lspconfig").setup({
				automatic_enable = {
					exclude = {
						"rust_analyzer",
					},
				},
			})
		end,
	},
}
