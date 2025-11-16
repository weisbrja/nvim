local harpoon_source = {
	finder = function()
		local output = {}
		for _, item in ipairs(require("harpoon"):list().items) do
			if item and item.value:match("%S") then
				table.insert(output, {
					text = item.value,
					file = item.value,
					pos = { item.context.row, item.context.col },
				})
			end
		end
		return output
	end,
	filter = {
		transform = function()
			return true
		end,
	},
	format = function(item)
		return {
			{ item.text },
			{ ":", "SnacksPickerDelim" },
			{ tostring(item.pos[1]), "SnacksPickerRow" },
			{ ":", "SnacksPickerDelim" },
			{ tostring(item.pos[2]), "SnacksPickerCol" },
		}
	end,
	preview = function(ctx)
		if Snacks.picker.util.path(ctx.item) then
			return Snacks.picker.preview.file(ctx)
		else
			return Snacks.picker.preview.none(ctx)
		end
	end,
	confirm = "jump",
}

local directories_source = {
	finder = function(opts, ctx)
		local cmd, _ = require("snacks.picker.source.files").get_cmd(opts.cmd)

		local args = { "--type", "d", "--color", "never", "-E", ".git" }
		if opts.hidden then
			table.insert(args, "--hidden")
		end
		if opts.ignored then
			table.insert(args, "--no-ignore")
		end
		if opts.follow then
			table.insert(args, "-L")
		end
		vim.list_extend(args, opts.args or {})

		return require("snacks.picker.source.proc").proc({
			cmd = cmd,
			args = args,
			notify = not opts.live,
			transform = function(item)
				item.file = item.text
				item.dir = true
			end,
		}, ctx)
	end,
	format = "file",
	show_empty = true,
}

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		picker = {
			enabled = true,
			sources = { harpoon = harpoon_source, directories = directories_source },
			layouts = {
				-- override vscode layout to use backdrop (all other options taken from the layout definition)
				vscode = {
					layout = {
						hidden = { "preview" },
						backdrop = 60,
						row = 1,
						width = 0.4,
						min_width = 80,
						height = 0.4,
						border = "none",
						box = "vertical",
						{
							win = "input",
							height = 1,
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
						},
						{ win = "list", border = "hpad" },
						{ win = "preview", title = "{preview}", border = "rounded" },
					},
				},
			},
		},
		scroll = { enabled = false },
		terminal = { enabled = false },
		words = { enabled = false },
		bigfile = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true, animate = { enabled = false } },
		input = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		statuscolumn = { enabled = true },
		zen = { enabled = false },
		lazygit = { enabled = true },
		rename = {
			enabled = true,
			config = function()
				vim.api.nvim_create_autocmd("User", {
					pattern = "OilActionsPost",
					callback = function(event)
						if event.data.actions[1].type == "move" then
							Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
						end
					end,
				})
			end,
		},
	},
	keys = {
		{
			"<Leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<Leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<Leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<Leader>t",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume Picker",
		},

		{
			"<Leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<Leader>f",
			function()
				Snacks.picker.files()
			end,
			desc = "Find File",
		},
		{
			"<Leader>F",
			function()
				Snacks.picker.files({ cwd = require("oil").get_current_dir() })
			end,
			desc = "Find File in current Oil Directory",
		},
		{
			"<Leader>d",
			function()
				Snacks.picker.pick("directories")
			end,
			desc = "Find Directory",
		},
		{
			"<Leader>D",
			function()
				Snacks.picker.pick("directories", { cwd = require("oil").get_current_dir() })
			end,
			desc = "Find Directory in current Oil Directory",
		},
		{
			"<Leader>z",
			function()
				Snacks.picker.zoxide()
			end,
			desc = "Zoxide",
		},
		{
			"<Leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<Leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<Leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<Leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<Leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log File",
		},
		{
			"<Leader>q",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gi",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gt",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto Type Definition",
		},
		{
			"gci",
			function()
				Snacks.picker.lsp_incoming_calls()
			end,
			desc = "Calls Incoming",
		},
		{
			"gco",
			function()
				Snacks.picker.lsp_outgoing_calls()
			end,
			desc = "Calls Outgoing",
		},
		{
			"<Leader>H",
			function()
				Snacks.picker.pick("harpoon")
			end,
			desc = "Harpoon Marks",
		},
		{
			"<Leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "LazyGit",
		},
	},
}
