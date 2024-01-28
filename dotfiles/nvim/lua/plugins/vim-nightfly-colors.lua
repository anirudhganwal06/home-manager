return {
	"bluz71/vim-nightfly-colors",
	config = function()
		vim.g.nightflyCursorColor = true
		vim.g.nightflyNormalFloat = true
		vim.g.nightflyTransparent = true
		vim.g.nightflyVirtualTextColor = true
		vim.g.nightflyWinSeparator = 2
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "single",
		})
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
			border = "single",
		})
		vim.diagnostic.config({ float = { border = "single" } })
	end,
}
