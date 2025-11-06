return {
	"hrsh7th/nvim-cmp",
	lazy = true,
	event = "InsertEnter",
	keys = { ":", "/", "?" },
	dependencies = {
		-- sources
		{ "hrsh7th/cmp-nvim-lsp", lazy = false },
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"petertriho/cmp-git",
		"hrsh7th/cmp-emoji",

		-- snippets
		-- "saadparwaiz1/cmp_luasnip",
		-- "l3mon4d3/LuaSnip",
	},
	config = function()
		-- cmp setup
		-- local luasnip = require("luasnip")
		local cmp = require("cmp")

		cmp.setup({
			completion = {
				completeopt = vim.o.completeopt,
			},
			-- snippet = {
			-- 	expand = function(args)
			-- 		luasnip.lsp_expand(args.body)
			-- 	end,
			-- },
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					-- elseif luasnip.expandable() then
					-- 	luasnip.expand()
					else
						fallback()
					end
				end, { "i" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i" }),
				["<C-n>"] = cmp.mapping.scroll_docs(4),
				["<C-p>"] = cmp.mapping.scroll_docs(-4),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				-- { name = "luasnip" },
			}, {
				{ name = "git" },
				{ name = "crates" },
				{ name = "path" },
			}, {
				{ name = "buffer", option = { keyword_pattern = [[\k\+]] } },
			}),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer", option = { keyword_pattern = [[\k\+]] } },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
			}),
		})

		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
			}, {
				{ name = "path" },
			}, {
				{ name = "buffer", option = { keyword_pattern = [[\k\+]] } },
			}),
		})
		require("cmp_git").setup({})
	end,
}
