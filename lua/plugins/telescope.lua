local function oilfd(opts)
	require("telescope.builtin").find_files({
		cwd = require("oil").get_current_dir(),
		find_command = {
			"fd",
			"--type",
			opts.type,
			"--color",
			"never",
			"--exclude",
			".git/",
		},
		hidden = true,
		no_ignore_parent = true,
		no_ignore = opts.no_ignore,
		preview = false,
	})
end

return {
	{
		-- "jamestrew/telescope.nvim",
		-- branch = "preview-opt-inheritance",
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		lazy = true,
		keys = {
			{
				"<Leader>t",
				function()
					require("telescope.builtin").resume()
				end,
			},
			{
				"<Leader>f",
				function()
					oilfd({ type = "file" })
				end,
			},
			{
				"<Leader>F",
				function()
					oilfd({ type = "file", no_ignore = true })
				end,
			},
			{
				"<Leader>d",
				function()
					oilfd({ type = "directory" })
				end,
			},
			{
				"<Leader>D",
				function()
					oilfd({ type = "directory", no_ignore = true })
				end,
			},
			{
				"<Leader>/",
				function()
					require("telescope.builtin").live_grep()
				end,
			},
			{
				"<Leader>b",
				function()
					require("telescope.builtin").buffers()
				end,
			},
			{ "<Leader>H", ":Telescope harpoon marks<CR>" },
		},
		config = function(_, _opts)
			local open_with_trouble = require("trouble.sources.telescope").open

			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					mappings = {
						i = { ["<C-t>"] = open_with_trouble },
						n = { ["<C-t>"] = open_with_trouble },
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						-- custom from here
						"--hidden",
						"--no-ignore",
						"--trim",
					},
					sorting_strategy = "ascending",
					layout_strategy = "vertical",
					layout_config = {
						prompt_position = "top",
						preview_cutoff = 15,
					},
					--preview = true,
					border = true,
				},
				pickers = {
					live_grep = {
						layout_strategy = "vertical",
						layout_config = {
							prompt_position = "top",
							preview_cutoff = 15,
						},
						preview = true,
					},
					find_files = {
						layout_strategy = "center",
						preview = false,
					},
					buffers = {
						layout_strategy = "center",
						preview = false,
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			telescope.load_extension("harpoon")

			-- vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "CursorLine" })
			-- vim.api.nvim_set_hl(0, "TelescopePromptCounter", { link = "StatusLineNC" })
		end,
	},
}
