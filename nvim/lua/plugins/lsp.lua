-- LSP configuration
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- LSP attach function for buffer-specific keymaps
		local on_attach = function(client, bufnr)
			vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			
			-- LSP navigation
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
			
			-- Workspace management
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)
			
			-- Code actions and navigation
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
			
			-- Document highlight
			if client.server_capabilities.documentHighlightProvider then
				local gid = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
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
			end
		end

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
		
		-- Setup completion capabilities
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		-- Configure diagnostic display
		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
				source = "if_many",
			},
			float = {
				source = "always",
				border = "rounded",
				header = "",
				prefix = "",
				focusable = false,
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		-- Auto show diagnostics on cursor hold
		vim.api.nvim_create_autocmd("CursorHold", {
			callback = function()
				local opts = {
					focusable = false,
					close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
					border = "rounded",
					source = "always",
					prefix = " ",
					scope = "cursor",
				}
				vim.diagnostic.open_float(nil, opts)
			end
		})

		-- Set updatetime for CursorHold event (default is 4000ms)
		vim.opt.updatetime = 300

		-- LSP server configurations
		local servers = {
			-- Use only ruff for Python LSP (handles linting, formatting, and basic language features)
			ruff = {
				capabilities = capabilities,
				on_attach = on_attach,
				init_options = {
					settings = {
						-- Configure ruff for comprehensive Python support
						args = {},
						lineLength = 88,
						lint = {
							enable = true,
							select = {"ALL"},  -- Enable all rules (can be customized)
						},
						format = {
							enable = true,
						}
					}
				}
			},
			gopls = { capabilities = capabilities, on_attach = on_attach },
			clangd = { capabilities = capabilities, on_attach = on_attach },
			kotlin_language_server = { capabilities = capabilities, on_attach = on_attach },
			ltex = { capabilities = capabilities, on_attach = on_attach },
			taplo = { capabilities = capabilities, on_attach = on_attach },
			zk = { capabilities = capabilities, on_attach = on_attach },
			-- Use biome LSP for JS/TS/HTML/CSS/Vue
			biome = {
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc", "html", "css", "vue" },
				cmd = { "biome", "lsp-proxy" },
				root_dir = function(fname)
					return require("lspconfig.util").root_pattern("biome.json", "biome.jsonc", ".git")(fname)
				end,
			},
			cssls = { capabilities = capabilities, on_attach = on_attach },
			tailwindcss = { 
				capabilities = capabilities, 
				on_attach = on_attach,
				flags = { debounce_text_changes = 150 } 
			},
			texlab = { 
				capabilities = capabilities, 
				on_attach = on_attach,
				filetypes = { "tex", "plaintex", "bib", "markdown" } 
			},
			jdtls = { capabilities = capabilities, on_attach = on_attach },
			rust_analyzer = {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			},
			html = { capabilities = capabilities, on_attach = on_attach },
			lua_ls = {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						diagnostics = {
							globals = { "vim" },
							enable = true,
						},
						format = {
							enable = true,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
		}

		-- Setup all servers
		for server_name, config in pairs(servers) do
			lspconfig[server_name].setup(config)
		end

		-- Setup fenced languages for markdown
		vim.g.markdown_fenced_languages = {
			"ts=typescript",
			"js=javascript",
			"py=python",
			"lua=lua",
		}

		-- none-ls configuration for formatting and diagnostics
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Basic formatters (CSS/HTML now handled by Biome)
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "scss", "markdown" },
				}),
				null_ls.builtins.formatting.stylua,
			},
			-- Format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("LspFormatting", {}),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}