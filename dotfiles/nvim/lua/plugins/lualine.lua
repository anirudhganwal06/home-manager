return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local noice = require("noice")
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
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
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
				lualine_x = {
					{
						noice.api.status.command.get,
						color = { fg = "#ff9e64" },
						cond = require("noice").api.status.command.has,
					},
					{
						noice.api.status.mode.get,
						color = { fg = "#ff9e64" },
						cond = require("noice").api.status.mode.has,
					},
					{
						"searchcount",
						maxcount = 99999,
						timeout = 500,
					},
					{
						"filetype",
						colored = true,
						icon_only = true,
						icon = { align = "right" },
					},
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
