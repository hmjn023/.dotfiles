-- Trouble.nvim configuration
return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	config = function()
		require("trouble").setup({
			signs = {
				error = "",
				warning = "",
				hint = "",
				information = "",
			},
		})
	end,
}