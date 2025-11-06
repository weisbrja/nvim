return {
	"l3mon4d3/LuaSnip",
	lazy = true,
	enabled = false,
	config = function()
		local luasnip = require("luasnip")
		local types = require("luasnip.util.types")

		require("luasnip.loaders.from_vscode").lazy_load()

		luasnip.setup({
			-- display a cursor-like placeholder in unvisited nodes of the snippet
			ext_opts = {
				[types.insertNode] = {
					unvisited = {
						virt_text = { { "|", "Conceal" } },
						virt_text_pos = "inline",
					},
				},
				[types.exitNode] = {
					unvisited = {
						virt_text = { { "|", "Conceal" } },
						virt_text_pos = "inline",
					},
				},
			},
		})

		vim.keymap.set("n", "<Tab>", function()
			luasnip.jump(1)
		end)
		vim.keymap.set("n", "<S-Tab>", function()
			luasnip.jump(-1)
		end)
	end,
}
