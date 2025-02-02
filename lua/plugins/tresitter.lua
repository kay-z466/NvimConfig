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
						init_selection = "gnn", -- Start incremental selection
						node_incremental = "grn", -- Expand selection
						scope_incremental = "grc", -- Expand to scope
						node_decremental = "grm", -- Shrink selection
					},
				},


			})
		end,
	}

}
