require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		ruby = { "rubocop" },
		javascript = { { "prettierd", "prettier" } },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
