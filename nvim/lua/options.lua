vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 3
vim.opt.shiftwidth =3
vim.opt.mouse="a"
vim.opt.splitright= true
vim.opt.completeopt = "menuone,noinsert"
vim.opt.pumblend=5
vim.opt.cursorline = true

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("lsp_signature").setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
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
		"lua"
	},
	autotag = {
		enable = true,
	},
})

require("telescope").setup {
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  },
}
require("telescope").load_extension('media_files')


local sidebar = require("sidebar-nvim")
local opts = {open = false, initial_width = 20}
sidebar.setup(opts)

require("nvim-autopairs").setup{}
require("toggleterm").setup{}
require("aerial").setup({
	on_attach = function(bufnr)
		vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
		vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
	end
})

require("lualine").setup()
require("formatter").setup{}
