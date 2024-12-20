return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				ruby = { "rubocop" },
				javascript = { "prettier", "eslint_d" },
				typescript = { "prettier", "eslint_d" },
				javascriptreact = { "prettier", "eslint_d" },
				typescriptreact = { "prettier", "eslint_d" },
				json = { "fixjson" },
				xml = { "xmlformat" },
				cpp = { "clang_format" },
				swift = { "swift_format" },
				html = { "prettierd", "eslint_d" },
				python = { "black" },
				sql = { "sql-formatter" },
				ejs = { "prettierd", "eslint_d" },
				css = { "prettierd", "eslint_d" },
				go = { "gofmt" },
				rust = { "rustfmt" },
				java = { "google-java-format" },
				bash = { "shfmt" },
			},
			format_after_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { lsp_format = "fallback" }
			end,
			notify_on_error = false,
		})

		-- Create :Format command to trigger formatting
		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			conform.format({ async = true, lsp_fallback = true, range = range })
		end, { range = true })

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
