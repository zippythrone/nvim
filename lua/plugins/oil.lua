return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  keys = {
    {
      "<leader>o",
      function()
        vim.cmd("Oil")
      end,
      desc = "Oil",
    },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
}
