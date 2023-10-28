local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--map('n','<C-f>',':NERDTreeToggle<CR>')
map("n", "<C-f>", ":Neotree toggle<CR>")
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>sb", ":SidebarNvimToggle<CR>")
map("n", "<C-l>", ":bnext<CR>")
map("n", "<C-h>", ":bprev<CR>")
map("n", "<Leader>ss", ":vsplit<CR>")
map("n", "<Leader>a", ":AerialToggle!<CR>")
map("n", "<C-t>", ":ToggleTerm<CR>")

map("n", "<Leader>f", "Format<CR>")
map("n", "<Leader>F", "FormatWrite<CR>")
