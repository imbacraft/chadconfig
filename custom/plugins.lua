local plugins = {

  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- code formatting, linting etc
  -- ["jose-elias-alvarez/null-ls.nvim"] = {
  --   after = "nvim-lspconfig",
  --   config = function()
  --     require "custom.plugins.null-ls"
  --   end,
  -- },

    ["lukas-reineke/indent-blankline.nvim"] = {
    disable = true
  },

  ["folke/which-key.nvim"] = {
    disable = false

  },

  ["mfussenegger/nvim-jdtls"] = {
    ft = "java",

  },

  -- -- DAP (Required to run Java unit tests)--
  ["mfussenegger/nvim-dap"] = {
    ft = "java"
  },

  ["Pocco81/DAPInstall.nvim"] = {
    ft = "java"
  }
}

return plugins
