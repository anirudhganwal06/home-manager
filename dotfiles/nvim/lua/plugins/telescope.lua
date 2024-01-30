return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>p", function()
			builtin.find_files({
				hidden = true,
			})
		end, {})

		vim.keymap.set("n", "<leader>P", builtin.commands, {})
		vim.keymap.set("v", "<leader>F", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", {})
		vim.keymap.set("n", "<leader>F", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, {})
		vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {})
		vim.keymap.set("n", "<leader>ft", builtin.filetypes, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>help", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>gbr", builtin.git_branches, {})
		vim.keymap.set("n", "<leader>gs", builtin.git_status, {})

		require("telescope").setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					-- prompt_position = 'top'
				},
			},
		})
	end,
}
