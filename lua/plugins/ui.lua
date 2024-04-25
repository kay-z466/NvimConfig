return {
	{
		"rcarriga/nvim-notify",
		opts = {},
		config = function()
			vim.notify = require("notify")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		--config = function()
			--vim.cmd("colorscheme gruvbox")
		--end
	},
	{
		"catppuccin/nvim",
		config = function()
			vim.cmd("colorscheme catppuccin-frappe")
		end
	},

}
