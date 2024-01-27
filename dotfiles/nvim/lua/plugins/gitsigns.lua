return {
	"lewis6991/gitsigns.nvim", -- Status line
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				map("n", "<leader>gah", gs.stage_hunk)
				map("n", "<leader>grh", gs.reset_hunk)
				map("v", "<leader>gah", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("v", "<leader>grh", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("n", "<leader>guh", gs.undo_stage_hunk)
				map("n", "<leader>gdh", gs.preview_hunk)
				map("n", "<leader>ga.", gs.stage_buffer)
				map("n", "<leader>gu.", gs.reset_buffer_index)
				map("n", "<leader>gr.", gs.reset_buffer)
				-- map("n", "<leader>gbl", function()
				-- 	gs.blame_line({ full = true })
				-- end)
				map("n", "<leader>gbl", gs.toggle_current_line_blame)
				map("n", "<leader>gd.", gs.diffthis)
				map("n", "<leader>gdD", function()
					gs.diffthis("~")
				end)
				map("n", "<leader>gtd", gs.toggle_deleted)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		})
	end,
}
