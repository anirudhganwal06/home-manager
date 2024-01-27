return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		vim.api.nvim_set_keymap("n", "<leader>b", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>rf", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

		-- Setup with some options
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
				icons = {
					show = {
						folder_arrow = false,
					},
					glyphs = {
						git = {
							untracked = "◌",
							unstaged = "○",
							staged = "●",
							ignored = "⊘",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
			},
			filters = {
				dotfiles = false, -- Show dotfiles
				git_ignored = false, -- Show git ignored files
			},
		})
	end,
}
