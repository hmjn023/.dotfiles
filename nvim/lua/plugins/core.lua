-- Core plugins without specific configuration
return {
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	"onsails/lspkind.nvim",
	"windwp/nvim-ts-autotag",
	"andymass/vim-matchup",
	"goolord/alpha-nvim",
	"EdenEast/nightfox.nvim",
	
	-- Language specific
	"mfussenegger/nvim-jdtls",
	"solidjs-community/solid-snippets",
	
	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_lua").load()
		end,
	},
	
	-- Visual multi-cursor
	{
		"mg979/vim-visual-multi",
		branch = "master",
		event = { "BufReadPre", "BufNewFile" },
	},
	
	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
}