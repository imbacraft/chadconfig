--Override options
vim.o.timeoutlen = 0

--Autocommands

--Close specific windows with q
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "startuptime" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
	end,
})

--Set conceallevel and wrap for markdown files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "markdown" },
	callback = function()
		vim.cmd([[
      set conceallevel=2
      set wrap
      set foldlevel=99
    ]])
	end,
})

--Don't autostart new comment line after a comment
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- Highlight on yank
local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})

--LSP Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = true }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- Displays hover information about the symbol under the cursor
		bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

		-- Jump to the definition
		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

		-- Jump to declaration
		bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

		-- Lists all the implementations for the symbol under the cursor
		bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

		-- Jumps to the definition of the type symbol
		bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

		-- Lists all the references
		bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

		-- Displays a function's signature information
		bufmap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

		-- Renames all references to the symbol under the cursor
		bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")

		-- Selects a code action available at the current cursor position
		bufmap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		bufmap("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")

		-- Show diagnostics in a floating window
		bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

		-- Move to the previous diagnostic
		bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

		-- Move to the next diagnostic
		bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	end,
})
