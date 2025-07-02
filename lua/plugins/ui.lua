return {
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.g.adwaita_darker = true    -- for darker version
			-- vim.g.adwaita_disable_cursorline = true -- to disable cursorline
			-- vim.g.adwaita_transparent = true -- makes the background transparent
			vim.cmd("colorscheme adwaita")
		end
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup {
	-- 			custom_highlights = function(colors)
	-- 				return {
	-- 					UfoFoldedEllipsis = { fg = colors.text, bg = colors.none },
	-- 				}
	-- 			end,
	-- 		}
	-- 		-- vim.cmd("colorscheme catppuccin-macchiato")
	-- 	end,
	-- },
}
