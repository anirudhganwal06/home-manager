return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>p", function()
			builtin.find_files({
				hidden = true,
			})
		end, {})
		vim.keymap.set("n", "<leader>tt", builtin.builtin, {})
		vim.keymap.set("n", "<leader>bu", builtin.buffers, {})
		vim.keymap.set("n", "<leader>th", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>tr", ":Telescope resume<CR>", {})
		vim.keymap.set("n", "<leader>tk", builtin.keymaps, {})
		vim.keymap.set("n", "<leader>P", builtin.commands, {})
		vim.keymap.set("v", "<leader>fa", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", {})
		vim.keymap.set("n", "<leader>fa", builtin.live_grep, {})
		vim.keymap.set({ "n", "v" }, "<leader>fw", builtin.grep_string, {})
		vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {})
		vim.keymap.set("n", "<leader>tft", builtin.filetypes, {})
		vim.keymap.set("n", "<leader>gbr", builtin.git_branches, {})
		vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
		vim.keymap.set("n", "<leader>mdt", function()
			builtin.diagnostics({ bufnr = 0 })
		end, {})

		telescope.setup({
			defaults = {
				layout_strategy = "vertical",
				prompt_prefix = "🔭 ",
				selection_caret = " ",
				path_display = { "truncate" },
				layout_config = {
					width = 0.8,
					height = 0.9,
					preview_cutoff = 0,
				},
			},

			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
					mappings = {
						n = {
							["d"] = "delete_buffer",
						},
					},
				},
			},
		})

		telescope.load_extension("noice")
		telescope.load_extension("notify")
	end,
}
