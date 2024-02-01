return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	},
	build = ":MasonUpdate", -- :MasonUpdate updates registry contents
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
			-- JS
			"tsserver",
		}

		mason_lspconfig.setup({
			ensure_installed = servers,
			automatic_installation = true,
		})

		local on_attach = function(ev)
			local opts = { buffer = ev.buf }

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>msh", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>maw", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<leader>mrw", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<leader>mlw", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set("n", "<leader>mtd", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>mrn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<leader>mca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>mf.", function()
				vim.lsp.buf.format({ async = true })
			end, opts)

			vim.keymap.set("n", "<leader>mdf", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>mdq", vim.diagnostic.setloclist)
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
