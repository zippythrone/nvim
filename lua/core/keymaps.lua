-- lua/config/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Exit insert mode with jj
map("i", "jj", "<Esc>", opts)

-- Move selected lines up/down
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Quiting
map("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all", silent = true })
map("n", "<leader>qa", "<cmd>wqa<CR>", { desc = "Quit all (save)", silent = true })

-- Split window management
map("n", "<leader>wv", "<C-w>v", { desc = "Split Vertically", silent = true })
map("n", "<leader>wh", "<C-w>s", { desc = "Split Horizontally", silent = true })
map("n", "<leader>we", "<C-w>=", { desc = "Equalize Splits", silent = true })
map("n", "<leader>wx", ":close<CR>", { desc = "Close Split", silent = true })

-- save with Ctrl+s
map({"n", "i"}, "<C-s>", "<cmd>w<CR>", opts)

map("n", "<leader>yf", function()
  local file = vim.fn.expand("%:p")
  local root = vim.fs.root(file, { ".git" }) or vim.uv.cwd()
  local relative = vim.fs.relpath(root, file) or vim.fn.fnamemodify(file, ":.")
  vim.fn.setreg("+", relative .. ":" .. vim.fn.line("."))
end, { desc = "Yank file path and line", silent = true })

-- Smart clear search highlight on <Esc>
map("n", "<Esc>", function()
  if vim.v.hlsearch == 1 then
    vim.v.hlsearch = 0
    return
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
end, { silent = true, desc = "Clear search highlight or behave as normal <Esc>" })
