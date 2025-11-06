vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "Xresources",
	command = "!xrdb %",
})
