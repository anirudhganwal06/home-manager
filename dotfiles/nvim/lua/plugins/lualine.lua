return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {
			blue = "#80a0ff",
			cyan = "#79dac8",
			black = "#080808",
			red = "#ff5189",
			darkgrey = "#303030",
			lightgreen = "#98C379",
			pastelred = "#E06C75",
			skyblue = "#56B6C2",
			yellow = "#FFEF8A",
			beige = "#f2dcd3",
		}

		local my_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.beige },
				b = { bg = colors.darkgrey },
				c = { bg = colors.darkgrey },
				z = { bg = colors.darkgrey },
			},
			insert = {
				a = { fg = colors.black, bg = colors.blue },
				z = { bg = colors.darkgrey },
			},
			visual = {
				a = { fg = colors.black, bg = colors.cyan },
				z = { bg = colors.darkgrey },
			},
			replace = {
				a = { fg = colors.black, bg = colors.red },
				z = { bg = colors.darkgrey },
			},
		}

		-- LSP clients attached to buffer
		local clients_lsp = function()
			local bufnr = vim.api.nvim_get_current_buf()

			local clients = vim.lsp.buf_get_clients(bufnr)
			if next(clients) == nil then
				return ""
			end

			local c = {}

			for _, client in pairs(clients) do
				table.insert(c, client.name)
			end
			return table.concat(c, "|")
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = my_theme,
				component_separators = { left = "", right = "CR" },
				section_separators = { left = " ", right = "SR" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icon = { "", align = "left" },
						padding = { left = 0, right = 1 },
						separator = { left = "" },
					},
				},
				lualine_b = {
					{
						"branch",
						padding = { left = 0, right = 1 },
						color = { fg = colors.lightgreen },
						icon = { " ", color = { fg = colors.black, bg = colors.lightgreen } },
						separator = { left = "", right = "" },
					},
					{
						"diff",
						padding = { left = 0, right = 1 },
						icon = { " ", color = { fg = colors.black, bg = colors.yellow } },
						separator = { left = "", right = "" },
					},
					{
						"diagnostics",
						padding = { left = 0, right = 1 },
						color = { fg = colors.pastelred },
						icon = { " ", color = { fg = colors.black, bg = colors.pastelred } },
						separator = { left = "", right = "" },
					},
					{
						"filetype",
						colored = true,
						icon_only = true,
						padding = 0,
						separator = { left = "", right = "" },
						color = { bg = colors.skyblue },
					},
					{
						"filename",
						file_status = true,
						path = 1,
						symbols = {
							modified = "*", -- Text to show when the file is modified.
							readonly = "⊘", -- Text to show when the file is non-modifiable or readonly.
							unnamed = "[No Name]", -- Text to show for unnamed buffers.
							newfile = "[New]", -- Text to show for newly created file before first write
						},
						padding = 1,
						color = { fg = colors.skyblue },
					},
				},
				lualine_c = {},
				lualine_x = {
					{
						"searchcount",
						maxcount = 99999,
						timeout = 500,
					},
					{
						require("noice").api.status.mode.get,
						cond = require("noice").api.status.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_y = {},
				lualine_z = {
					{
						clients_lsp,
						padding = { left = 0, right = 1 },
						color = { fg = colors.pastelred },
						icon = { " ", color = { fg = colors.black, bg = colors.pastelred } },
						separator = { left = "" },
					},
					{
						"location",
						padding = 0,
						color = { fg = colors.lightgreen },
						icon = { " ", color = { fg = colors.black, bg = colors.lightgreen } },
						separator = { left = "" },
					},
					{
						"progress",
						color = { fg = colors.lightgreen },
						separator = { right = "" },
					},
				},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
