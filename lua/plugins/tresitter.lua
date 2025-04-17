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

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnm", -- Start incremental selection
						node_incremental = "gnn", -- Expand selection
						scope_incremental = "gnr", -- Expand to scope
						node_decremental = "gnp", -- Shrink selection
					},
				},

			})
		end,
	}

}
