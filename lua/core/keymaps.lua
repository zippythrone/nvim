local opts = { noremap = true, silent = true }

-- Exit insert mode
vim.keymap.set("i", "jj", "<ESC>", opts)

-- select current line in V-mode with vv
vim.api.nvim_set_keymap("n", "vv", "0v$", opts)

-- move selected lines in V-mode up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Smart clear hightlight search
vim.keymap.set("n", "<Esc>", function()
  if vim.v.hlsearch == 1 then
    vim.v.hlsearch = 0
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  end
end, { silent = true, desc = "Clear search highlight or behave as normal <Esc>" })

-- Delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- quit neovim
vim.keymap.set(
  { "v", "n" },
  "<leader>qq",
  "<cmd>qa<CR>",
  { noremap = true, silent = true, desc = "quit (without save)" }
)
vim.keymap.set({ "v", "n" }, "<leader>qa", "<cmd>wqa<CR>", { noremap = true, silent = true, desc = "quit (save all)" })

vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", opts)
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", opts)
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", opts)
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", opts)

-- <space>+y to yank the entire file
vim.keymap.set("n", "<leader>y", ":%y<CR>", { desc = "Yank entire file" })
