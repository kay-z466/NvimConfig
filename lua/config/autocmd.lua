vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "habamax",
	callback = function()
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "NONE", bg = "NONE" })
	end,
})

-- vim.cmd("colorscheme habamax")
