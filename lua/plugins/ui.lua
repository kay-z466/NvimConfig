return {
	{
		"m4xshen/catppuccinight.nvim",
		name = "catppuccin",
		opts = {
			flavour = "mocha",
			 transparent_background = true,
			custom_highlights = function(colors)
				return {
					VertSplit = { fg = colors.surface0 },
				}
			end,
		},
		init = function()
			vim.cmd.colorscheme("catppuccin-frappe")
		end,
	},
	{
		"rcarriga/nvim-notify",
		opts = {},
		config = function()
			vim.notify = require("notify")
		end,
	},
}
