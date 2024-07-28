return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = "all",
			auto_install = true,

			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "vii", -- No need for this (v;) works the same
					scope_incremental = "<CR>",
					node_incremental = ";",
					node_decremental = ",",
				},
			},
		})
	end,
}
