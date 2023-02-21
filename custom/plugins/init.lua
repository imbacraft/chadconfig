local overrides = require "custom.plugins.overrides"

local plugins = {

  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  ["dstein64/vim-startuptime"] = {
    cmd = "StartupTime",
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  -- ["kyazdani42/nvim-tree.lua"] = {
  --   override_options = overrides.nvimtree,
  -- },

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["hrsh7th/nvim-cmp"] = {
    override_options = function()
      local cmp = require "cmp"
      local select_opts = { behavior = cmp.SelectBehavior.Select }
      return {
        mapping = {
          ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
          ["<Down>"] = cmp.mapping.select_next_item(select_opts),
        },
      }
    end,
  },

  ["ahmedkhalf/project.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("project_nvim").setup {}
      local t = require "telescope"
      t.load_extension "projects"
    end,
  },

  -- ["nvim-treesitter/nvim-treesitter-textobjects"] = {
  --   after = "nvim-treesitter",
  --   setup = function()
  --     require("nvim-treesitter.configs").setup {
  --       textobjects = {
  --         select = {
  --           enable = true,
  --
  --           -- Automatically jump forward to textobj, similar to targets.vim
  --           lookahead = true,
  --
  --           keymaps = {
  --             -- You can use the capture groups defined in textobjects.scm
  --             ["af"] = "@function.outer",
  --             ["if"] = "@function.inner",
  --             ["ac"] = "@class.outer",
  --             -- You can optionally set descriptions to the mappings (used in the desc parameter of
  --             -- nvim_buf_set_keymap) which plugins like which-key display
  --             ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
  --           },
  --           -- You can choose the select mode (default is charwise 'v')
  --           --
  --           -- Can also be a function which gets passed a table with the keys
  --           -- * query_string: eg '@function.inner'
  --           -- * method: eg 'v' or 'o'
  --           -- and should return the mode ('v', 'V', or '<c-v>') or a table
  --           -- mapping query_strings to modes.
  --           selection_modes = {
  --             ["@parameter.outer"] = "v", -- charwise
  --             ["@function.outer"] = "V", -- linewise
  --             ["@class.outer"] = "<c-v>", -- blockwise
  --           },
  --           -- If you set this to `true` (default is `false`) then any textobject is
  --           -- extended to include preceding or succeeding whitespace. Succeeding
  --           -- whitespace has priority in order to act similarly to eg the built-in
  --           -- `ap`.
  --           --
  --           -- Can also be a function which gets passed a table with the keys
  --           -- * query_string: eg '@function.inner'
  --           -- * selection_mode: eg 'v'
  --           -- and should return true of false
  --           include_surrounding_whitespace = true,
  --         },
  --       },
  --     }
  --   end,
  -- },

  -- ["EdenEast/nightfox.nvim"] = {},
  ["nyoom-engineering/oxocarbon.nvim"] = {},

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
    requires = {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require "custom.plugins.trouble"
      end,
    },
  },
}

return plugins
