return {
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			-- vim.cmd("colorscheme gruvbox")
		end
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup {
				custom_highlights = function(colors)
					return {
						UfoFoldedEllipsis = { fg = colors.text, bg = colors.none },
					}
				end,
			}
			vim.cmd("colorscheme catppuccin-macchiato")
		end,
	},

}
