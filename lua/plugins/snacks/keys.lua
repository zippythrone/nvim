local keys = {
  {
    "<leader>bd",
    function()
      Snacks.bufdelete()
    end,
    desc = "Quit buffer",
  },
  {
    "<leader>e",
    function()
      Snacks.explorer()
    end,
    desc = "Explorer",
  },

  {
    "<leader>ff",
    function()
      Snacks.picker.smart()
    end,
    desc = "Files",
  },
  {
    "<leader><leader>",
    function()
      Snacks.picker.buffers()
    end,
    desc = "Browse buffers",
  },

  {
    "<leader>sk",
    function()
      Snacks.picker.keymaps()
    end,
    desc = "Keymaps",
  },
  {
    "<leader>sH",
    function()
      Snacks.picker.highlights()
    end,
    desc = "Highlights",
  },
  {
    "<leader>sh",
    function()
      Snacks.picker.help()
    end,
    desc = "Help pages",
  },
  {
    "<leader>si",
    function()
      Snacks.picker.icons()
    end,
    desc = "Icons",
  },
  {
    "<leader>sa",
    function()
      Snacks.picker.autocmds()
    end,
    desc = "Autocmds",
  },

  {
    "<leader>n",
    function()
      Snacks.picker.notifications()
    end,
    desc = "Notification history",
  },
  {
    "<leader>fg",
    function()
      Snacks.picker.grep()
    end,
    desc = "Grep",
  },
  {
    "gd",
    function()
      Snacks.picker.lsp_definitions()
    end,
    desc = "Goto Definition",
  },
  {
    "<leader>ss",
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = "LSP Symbols",
  },
  {
    "<leader>sS",
    function()
      Snacks.picker.lsp_workspace_symbols()
    end,
    desc = "LSP Workspace Symbols",
  },
}
return keys
