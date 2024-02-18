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
    },
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
{
"catppuccin/nvim",
     config = function()
vim.cmd("colorscheme catppuccin-frappe")  
end
},

}
