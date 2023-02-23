local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	-- Lua
	b.formatting.stylua,

	-- Meta formatters
	b.formatting.prettierd.with({
		filetypes = { "html", "yaml", "javascript", "typescript" },
	}),

	--Java
	b.formatting.google_java_format,

	--Shell scripting
	b.formatting.shfmt,
	b.diagnostics.shellcheck,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

null_ls.setup({
	debug = false,
	sources = sources,
	on_attach = on_attach,
})
