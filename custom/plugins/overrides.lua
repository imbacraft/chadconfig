local M = {}

M.mason = {
	ensure_installed = {
		-- Lua
		"lua-language-server",
		"stylua",

		-- SQL
		"sqls",
		"sqlfluff",
		"sql-formatter",

		-- JavaScript/Typescript
		"typescript-language-server",
		"prettierd",
		"eslint_d",
		"json-lsp",

		-- Rust
		-- "rust-analyzer",
		-- "rustfmt",

		-- File Formats
		"json-lsp",
		"jsonlint",
		"jq",
		"yaml-language-server",
		"yamllint",
		"yamlfmt",

		-- Git
		"commitlint",
		"gitlint",

		-- Writing
		"marksman",
		"markdownlint",
		"vale",
		"write-good",
		"cspell",
		"misspell",
		"proselint",

		-- Shell
		"bash-language-server",
		"beautysh",
		"shfmt",
		"shellcheck",
		"shellharden",

		--Java
		"jdtls",

		-- Others
		"ansible-language-server",
		"css-lsp",
		"codespell",
		"dockerfile-language-server",
		"dot-language-server",
		"editorconfig-checker",
		"html-lsp",
	},
}

M.treesitter = {
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"dockerfile",
		"dot",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"html",
		"http",
		"java",
		"javascript",
		"jq",
		"json",
		"json5",
		"jsonc",
		"kotlin",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"org",
		"python",
		"regex",
		"rust",
		"sql",
		"todotxt",
		"toml",
		"typescript",
		"vim",
		"yaml",
		"zig",
	},
}

M.nvimtree = {
	filters = {
		dotfiles = true,
	},
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
	view = {
		hide_root_folder = false,
	},
}

return M
