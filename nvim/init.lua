local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	"wbthomason/packer.nvim",
	"ryanoasis/vim-devicons",
	"tpope/vim-commentary",
	"preservim/nerdtree",
	"EdenEast/nightfox.nvim",
	"neovim/nvim-lspconfig",
	"ray-x/lsp_signature.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"onsails/lspkind.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/vim-vsnip",
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-frecency.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	"GustavoKatel/sidebar.nvim",
	"goolord/alpha-nvim",
	"terryma/vim-multiple-cursors",
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"nvim-treesitter/nvim-treesitter",
	"elentok/format-on-save.nvim",
	"nvim-lualine/lualine.nvim",
	"adelarsq/image_preview.nvim",
	"xiyaowong/link-visitor.nvim",
	"mfussenegger/nvim-jdtls",
	"folke/noice.nvim",
	"rcarriga/nvim-notify",
	"solidjs-community/solid-snippets",
	"aca/emmet-ls",
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_lua").load()
		end,
	},
})

vim.cmd("colorscheme nightfox")

require("options")
require("keybind")
require("lsp")
