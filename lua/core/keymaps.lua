-- lua/config/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Exit insert mode with jj
map("i", "jj", "<Esc>", opts)

-- Window navigation
map("n", "<C-h>", "<cmd>wincmd h<CR>", opts)
map("n", "<C-j>", "<cmd>wincmd j<CR>", opts)
map("n", "<C-k>", "<cmd>wincmd k<CR>", opts)
map("n", "<C-l>", "<cmd>wincmd l<CR>", opts)

-- Move selected lines up/down
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Quiting
map("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all (without save)", silent = true })
map("n", "<leader>qa", "<cmd>wqa<CR>", { desc = "Quit all (save)", silent = true })

-- Split window management
map("n", "<leader>wv", "<C-w>v", { desc = "Split Vertically", silent = true })
map("n", "<leader>wh", "<C-w>s", { desc = "Split Horizontally", silent = true })
map("n", "<leader>we", "<C-w>=", { desc = "Equalize Splits", silent = true })
map("n", "<leader>wx", ":close<CR>", { desc = "Close Split", silent = true })

-- Smart clear search highlight on <Esc>
map("n", "<Esc>", function()
  if vim.v.hlsearch == 1 then
    vim.v.hlsearch = 0
    return
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
end, { silent = true, desc = "Clear search highlight or behave as normal <Esc>" })
