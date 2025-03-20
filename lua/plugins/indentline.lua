return {
	-- Add indentation guides even on blank lines
	-- "lukas-reineke/indent-blankline.nvim",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
		},
	},
	{
		"echasnovski/mini.indentscope",
		opts = {
			options = { try_as_border = true },
		},
		config = function()
			require('mini.indentscope').setup({ symbol = '│' })
		end,
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	}


}
