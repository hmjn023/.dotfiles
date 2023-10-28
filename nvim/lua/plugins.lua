vim.cmd([[packadd packer.nvim]])

require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("ryanoasis/vim-devicons")
	use("tpope/vim-commentary")
	use("preservim/nerdtree")
	use("EdenEast/nightfox.nvim")
	use("neovim/nvim-lspconfig")
	use("ray-x/lsp_signature.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind.nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/vim-vsnip")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	tag = "0.1.0"
	use("nvim-telescope/telescope-frecency.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("GustavoKatel/sidebar.nvim")
	use("goolord/alpha-nvim")
	use("terryma/vim-multiple-cursors")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter")
	use("elentok/format-on-save.nvim")
	use("nvim-lualine/lualine.nvim")
	use("adelarsq/image_preview.nvim")
	use("xiyaowong/link-visitor.nvim")
	opt = true
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	use({
		"andymass/vim-matchup",
		setup = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	})
	use({
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
end)

vim.cmd("colorscheme nightfox")
