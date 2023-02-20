local M = {}

local opts = { noremap = true, silent = true }

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["Q"] = { "<cmd>close<CR>", "close window", opts},
    ["<leader>w<Left>"] = { "<C-w>h", "Window left", opts},
    ["<leader>w<Up>"] = { "<C-w>j", "Window up", opts},
    ["<leader>w<Down>"] = { "<C-w>k", "Window down", opts},
    ["<leader>w<Right>"] = { "<C-w>l", "Window right", opts},
    ["<leader>ww"] = { "<C-w>w", "Last window", opts},
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Documentation", opts},
  },
}

-- more keybinds!

return M;
