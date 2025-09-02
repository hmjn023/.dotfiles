-- Treesitter configuration
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			ensure_installed = {
				"lua", "vim", "vimdoc", "query",
				"javascript", "typescript", "tsx",
				"python", "rust", "go", "java",
				"html", "css", "json", "yaml", "toml",
				"markdown", "bash",
			},
		})
	end,
}