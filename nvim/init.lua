-- Bootstrap lazy.nvim
require("bootstrap")

-- Setup lazy.nvim with plugin directory
require("lazy").setup("plugins", {
	ui = {
		border = "rounded",
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- Load core configuration
require("options")
require("keybind")
require("ui")