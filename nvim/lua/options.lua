vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.mouse = "a"
vim.opt.splitright = true
vim.opt.completeopt = "menuone,noinsert"
vim.opt.pumblend = 20
vim.opt.cursorline = true

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	automatic_installation = true,
})
require("lsp_signature").setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	handler_opts = {
		border = "rounded",
	},
})

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	sync_install = false,
	auto_install = true,
	ensure_installed = {
		"tsx",
		"toml",
		"fish",
		"php",
		"json",
		"yaml",
		"swift",
		"css",
		"html",
		"lua",
		"bash",
	},
	ignore_install = {},
	modules = {},
	autotag = {
		enable = true,
	},
})

require("telescope").setup({
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg" },
			find_cmd = "rg", -- find command (defaults to `fd`)
		},
	},
})
require("telescope").load_extension("media_files")

local sidebar = require("sidebar-nvim")
local opts = { open = false, initial_width = 20 }
sidebar.setup(opts)

require("nvim-autopairs").setup({})
require("toggleterm").setup({})
require("aerial").setup({
	on_attach = function(bufnr)
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,
})

require("lualine").setup({})

local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")
require("format-on-save").setup({
	formatter_by_ft = {
		css = formatters.prettierd,
		html = formatters.prettierd,
		javascript = formatters.lsp,
		lua = formatters.stylua,
		rust = formatters.lsp,
		typescript = formatters.prettierd,
		typescriptreact = formatters.prettierd,
		python = formatters.black,
		json = formatters.jq,
		c = formatters.lsp,
		latex = formatters.latexindent,
		kotlin = formatters.lsp,
	},
})

require("image_preview").setup()
require("link-visitor").setup({
	open_cmd = "xdg-open",
	--[[ cmd to open url
    defaults:
    win or wsl: cmd.exe /c start
    mac: open
    linux: xdg-open
  --]]
	silent = true, -- disable all prints, `false` by defaults skip_confirmation
	skip_confirmation = false, -- Skip the confirmation step, default: false
	border = "rounded", -- none, single, double, rounded, solid, shadow see `:h nvim_open_win()`
})

require("neo-tree").setup({
	window = {
		width = 25,
	},
	filesystem = {
		window = {
			mappings = {
				["<leader>p"] = "image_wezterm", -- " or another map
			},
		},
		commands = {
			image_wezterm = function(state)
				local node = state.tree:get_node()
				if node.type == "file" then
					require("image_preview").PreviewImage(node.path)
				end
			end,
		},
	},
})

require("jdtls").start_or_attach({
	cmd = {
		"java",
		"-jar",
		"/home/hmjn/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar",
	},
})
