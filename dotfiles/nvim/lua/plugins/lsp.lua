return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	},
	run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	config = function()
		vim.print("Configuring LSP")
		require("mason").setup()
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")

		local servers = {
			-- Lua
			"lua_ls",
			-- Ruby
			"solargraph",
			"rubocop",
			-- JS
			"tsserver",
		}

		local on_attach = function(_, _)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>mca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>mrr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>mrn", vim.lsp.buf.rename, {})
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason_lspconfig.setup({
			ensure_installed = servers,
			automatic_installation = true,
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
		})

		local signs = { Error = "", Warn = "", Hint = "", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
	end,
}
