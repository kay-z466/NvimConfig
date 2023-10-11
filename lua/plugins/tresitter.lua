return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				ensure_installed = {
					"c",
					"cpp",
					"python",
					"lua",
					"vim",
					"html",
					"css",
					"comment",
					"vimdoc",
					"tsx",
					"julia",
			},
				highlight = { enable = true },
				indent = { enable = false },
				autotag = { enable = true },

			})
		end,
	},

}
