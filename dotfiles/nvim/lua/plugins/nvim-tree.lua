return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		vim.api.nvim_set_keymap("n", "<leader>bb", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>rf", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

		-- Setup with some options
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 30,
				side = "right",
			},
			renderer = {
				full_name = true,
				root_folder_label = function(path)
					return " " .. vim.fn.fnamemodify(path, ":t") .. " "
				end,
				group_empty = false,
				icons = {
					show = {
						folder_arrow = false,
					},
					git_placement = "after",
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
				show_on_dirs = true,
				show_on_open_dirs = false,
			},
			filters = {
				dotfiles = false, -- Show dotfiles
				git_ignored = false, -- Show git ignored files
			},
		})
	end,
}
