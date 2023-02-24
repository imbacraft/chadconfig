local overrides = require("custom.plugins.overrides")

local plugins = {

	-- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

	["ray-x/lsp_signature.nvim"] = {
		event = "InsertEnter",
		config = function()
			require("lsp_signature").setup({
				floating_window = false,
			})
		end,
	},

	["nmac427/guess-indent.nvim"] = {
		event = "WinScrolled",
		config = function()
			require("guess-indent").setup({})
		end,
	},

	["rcarriga/nvim-dap-ui"] = {
		ft = "java",
		config = function()
			require("dapui").setup()
		end,
	},

	["simrat39/symbols-outline.nvim"] = {
		cmd = "SymbolsOutline",
		config = function()
			require("symbols-outline").setup()
		end,
	},

	-- ["Darazaki/indent-o-matic"] = {
	-- 	event = "WinScrolled",
	-- 	confg = function()
	-- 		require("indent-o-matic").setup({})
	-- 	end,
	-- },

	--Smooth scrolling
	["karb94/neoscroll.nvim"] = {
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup()
		end,
	},

	["kylechui/nvim-surround"] = {
		event = "InsertEnter",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	["kdheepak/lazygit.nvim"] = {
		cmd = "LazyGit",
	},

	["f-person/git-blame.nvim"] = {
		cmd = "GitBlameToggle",
	},

	--Replace with sed cmd
	["windwp/nvim-spectre"] = {
		module = "spectre",
		config = function()
			require("spectre").setup()
		end,
	},

	["dstein64/vim-startuptime"] = {
		cmd = "StartupTime",
	},

	-- Code Runner
	["is0n/jaq-nvim"] = {
		cmd = "Jaq",
		config = function()
			require("custom.plugins.jaq")
		end,
	},

	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	["nvim-tree/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
	},

	-- Override plugin definition options
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	["hrsh7th/nvim-cmp"] = {
		override_options = function()
			local cmp = require("cmp")
			local select_opts = { behavior = cmp.SelectBehavior.Select }
			return {
				mapping = {
					["<Up>"] = cmp.mapping.select_prev_item(select_opts),
					["<Down>"] = cmp.mapping.select_next_item(select_opts),
				},
				sources = {
					{ name = "luasnip", keyword_length = 2, max_item_count = 2 },
					{ name = "nvim_lsp", keyword_length = 3 }, --keyword_length : how many characters are necessary to trigger autocompletion
					{ name = "buffer", keyword_length = 3, max_item_count = 2 },
					{ name = "nvim_lua", keyword_length = 3, max_item_count = 2 },
					{ name = "path" },
				},
			}
		end,
	},

	["ahmedkhalf/project.nvim"] = {
		after = "telescope.nvim",
		config = function()
			require("project_nvim").setup({})
			local t = require("telescope")
			t.load_extension("projects")
		end,
	},

	-- ["nvim-treesitter/nvim-treesitter-textobjects"] = {
	-- 	module = "nvim-treesitter-textobjects",
	-- 	after = "nvim-treesitter",
	-- 	setup = function()
	-- 		require("nvim-treesitter.configs").setup({
	-- 			textobjects = {
	-- 				select = {
	-- 					enable = true,
	--
	-- 					-- Automatically jump forward to textobj, similar to targets.vim
	-- 					lookahead = true,
	--
	-- 					keymaps = {
	-- 						-- You can use the capture groups defined in textobjects.scm
	-- 						["af"] = "@function.outer",
	-- 						["if"] = "@function.inner",
	-- 						["ac"] = "@class.outer",
	-- 						-- You can optionally set descriptions to the mappings (used in the desc parameter of
	-- 						-- nvim_buf_set_keymap) which plugins like which-key display
	-- 						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
	-- 					},
	-- 					-- You can choose the select mode (default is charwise 'v')
	-- 					--
	-- 					-- Can also be a function which gets passed a table with the keys
	-- 					-- * query_string: eg '@function.inner'
	-- 					-- * method: eg 'v' or 'o'
	-- 					-- and should return the mode ('v', 'V', or '<c-v>') or a table
	-- 					-- mapping query_strings to modes.
	-- 					selection_modes = {
	-- 						["@parameter.outer"] = "v", -- charwise
	-- 						["@function.outer"] = "V", -- linewise
	-- 						["@class.outer"] = "<c-v>", -- blockwise
	-- 					},
	-- 					-- If you set this to `true` (default is `false`) then any textobject is
	-- 					-- extended to include preceding or succeeding whitespace. Succeeding
	-- 					-- whitespace has priority in order to act similarly to eg the built-in
	-- 					-- `ap`.
	-- 					--
	-- 					-- Can also be a function which gets passed a table with the keys
	-- 					-- * query_string: eg '@function.inner'
	-- 					-- * selection_mode: eg 'v'
	-- 					-- and should return true of false
	-- 					include_surrounding_whitespace = false,
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	-- ["EdenEast/nightfox.nvim"] = {},
	-- ["nyoom-engineering/oxocarbon.nvim"] = {},

	["lukas-reineke/indent-blankline.nvim"] = {
		disable = true,
	},

	["folke/which-key.nvim"] = {
		disable = false,
	},

	["mfussenegger/nvim-jdtls"] = {
		ft = "java",
	},

	-- -- DAP (Required to run Java unit tests)--
	["mfussenegger/nvim-dap"] = {
		ft = "java",
	},

	["Pocco81/DAPInstall.nvim"] = {
		ft = "java",
	},

	["folke/trouble.nvim"] = {
		cmd = "TroubleToggle",
		config = function()
			require("custom.plugins.trouble")
		end,
	},
}

return plugins
