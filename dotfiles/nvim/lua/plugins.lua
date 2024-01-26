-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Theme
	use("bluz71/vim-nightfly-colors")

	-- Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- File Icons support
	use("nvim-tree/nvim-web-devicons")

	-- File Explorer
	use("nvim-tree/nvim-tree.lua")

	-- Auto Completion
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("rafamadriz/friendly-snippets") -- Collection of snippets
	use("L3MON4D3/LuaSnip") -- Snippets plugin

	-- LSP
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})

	-- Formatter
	use("stevearc/conform.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Status line
	use({
		"nvim-lualine/lualine.nvim",
		-- requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- Autosave
	-- use("pocco81/auto-save.nvim")
	use("tmillr/sos.nvim")

	-- Comment code
	use("numToStr/Comment.nvim")
end)
