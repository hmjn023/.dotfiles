local opts = { noremap = true, silent = true }
--[[
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end
]]

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "cmdline" },
		{ name = "git" },
		{ name = "vsnip" },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
	},
	experimental = {
		ghost_text = true,
	},
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

lspconfig.pyright.setup({ capabilities = capabilities })
lspconfig.gopls.setup({ capabilities = capabilities })
lspconfig.clangd.setup({ capabilities = capabilities })
lspconfig.kotlin_language_server.setup({ capabilities = capabilities })
lspconfig.ltex.setup({ capabilities = capabilities })
lspconfig.taplo.setup({ capabilities = capabilities })
lspconfig.zk.setup({ capabilities = capabilities })

lspconfig.ts_ls.setup({ capabilities = capabilities })
lspconfig.cssls.setup({ capabilities = capabilities })
lspconfig.tailwindcss.setup({ capabilities = capabilities, flags = { debounce_text_changes = 150 } })
lspconfig.texlab.setup({ capabilities = capabilities, filetypes = { "tex", "plaintex", "bib", "markdown" } })
lspconfig.jdtls.setup({ capabilities = capabilities })
-- lspconfig.denols.setup({ capabilities = capabilities })
vim.g.markdown_fenced_languages = {
	"ts=typescript",
}
lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {},
	},
})
lspconfig.html.setup({})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				library = vim.env.VIMRUNTIME,
			},
		},
	},
})

--[[
lspconfig.emmet_ls.setup({
	-- on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"svelte",
		"pug",
		"typescriptreact",
		"vue",
	},
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})
]]
local gid = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
	group = gid,
	buffer = bufnr,
	callback = function()
		vim.lsp.buf.document_highlight()
	end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
	group = gid,
	buffer = bufnr,
	callback = function()
		vim.lsp.buf.clear_references()
	end,
})
