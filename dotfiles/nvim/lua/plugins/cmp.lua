return {
	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	dependencies = {
		"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
		"rafamadriz/friendly-snippets", -- Collection of snippets
		"L3MON4D3/LuaSnip", -- Snippets plugin -- LSP
	},
	config = function()
		local luasnip = require("luasnip")
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
				["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
				-- C-b (back) C-f (forward) for snippet placeholder navigation.
				["<C-i>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
		})

		-- local signs = { Method = "" }
		-- for type, icon in pairs(signs) do
		-- 	local hl = "CmpItemKind" .. type
		-- 	vim.print(hl)
		-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		-- end
	end,
}
