-- Numbering options
vim.opt.number = true
vim.opt.relativenumber = true

-- Clipboard and mouse support
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse:append("a")

-- Indentation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- File handling
vim.opt.swapfile = false
vim.opt.writebackup = true
vim.opt.undofile = true
vim.opt.fileencoding = "utf-8"
vim.opt.confirm = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Scrolling
vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 8

-- Terminal and visual settings
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- show asci charaters as symbols
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- implement stack jump list
-- vim.opt.jumplists = ""
--

vim.o.winborder = 'rounded'

vim.opt.splitbelow = true
vim.opt.splitright = true
