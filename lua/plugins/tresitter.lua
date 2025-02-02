return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				ensure_installed = {
					"python",
					"lua",
					"vim",
					"comment",
					"vimdoc",
				},
				highlight = {
					enable = true,
					disable = { "latex" }
				},
				indent = { enable = true },
				autotag = { enable = true },
			})
		end,
	}

}
