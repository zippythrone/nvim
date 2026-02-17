local opts = {
	style = "night",
	-- transparent = true,
}
-- local opts = {}

local tokyonight = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup(opts)
		vim.cmd([[colorscheme tokyonight]])
	end,
}

local dracula = {
	"Mofiqul/dracula.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme dracula]])
	end,
}

return dracula
