return {
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
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
			-- vim.cmd("colorscheme catppuccin-macchiato")
		end,
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- }

}
