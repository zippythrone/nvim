return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", enabled = false, opts = {} },
  },

  opts = {
    sort = { "group" },
    preset = "helix",

    spec = {
      { "<leader>L", "<cmd>Lazy<CR>", desc = "Lazy", mode = "n", icon = "󰒲" },
      { "<leader>e", group = "explorer", icon = "" },
      { "<leader>t", group = "toggle", icon = "" },
      { "<leader>n", icon = "󰚢" },
      { "<leader><leader>", icon = " " },

      { "<leader>qa", icon = "󰈆" },
      { "<leader>bd", icon = "" },

      { "<leader>f", group = "find", icon = " " },
      { "<leader>ff", icon = " " },
      { "<leader>fg", icon = " " },

      { "<leader>c", group = "code (LSP)", icon = "" },
      { "<leader>b", group = "buffer", icon = " " },
      { "<leader>s", group = "search", icon = "󰱼 " },
      { "<leader>q", group = "quit", icon = "󰈆" },
      { "<leader>w", group = "window", icon = "" },

      { "<leader>?", icon = "" },
      {"<leader>M", icon = "󰨺"}
    },
  },

  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Local Keymaps (which-key)",
    },
  },
}
