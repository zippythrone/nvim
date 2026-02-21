return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    scroll = { enabled = true },
    toggle = { enabled = true },
    input = {enabled = true},
  },
  keys = require("plugins.snacks.keys"),
  config = function(_, opts)
    local Snacks = require("snacks")
    Snacks.setup(opts)
    require("plugins.snacks.toggle").setup()
  end,
}
