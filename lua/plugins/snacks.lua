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
  },

  keys = {
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
  },

  config = function(_, opts)
    local Snacks = require("snacks")
    Snacks.setup(opts)

    -- Toggles (stateful, Snacks-native)
    Snacks.toggle.indent():map("<leader>tg")
    Snacks.toggle.diagnostics():map("<leader>td")
    Snacks.toggle.treesitter():map("<leader>tt")
    Snacks.toggle.line_number():map("<leader>tl")

    local function ruff_ns_id()
      for ns_id, ns in pairs(vim.diagnostic.get_namespaces()) do
        local name = ns.name
        if type(name) == "string" and name:match("^vim%.lsp%.ruff%.%d+%.Ruff$") then
          return ns_id, name
        end
      end
    end

    local ruff_diag_cache = {} ---@type table<integer, vim.Diagnostic[]>

    Snacks.toggle
      .new({
        id = "diag_ruff",
        name = "Ruff Diagnostics",
        get = function()
          local ns_id = ruff_ns_id()
          if not ns_id then
            return false
          end
          return vim.diagnostic.is_enabled({ ns_id = ns_id, bufnr = 0 })
        end,
        set = function(state)
          local bufnr = 0
          local ns_id = ruff_ns_id()
          if not ns_id then
            Snacks.notify.warn("Ruff diagnostic namespace not found.", { title = "Ruff Diagnostics" })
            return
          end

          if not state then
            ruff_diag_cache[vim.api.nvim_get_current_buf()] = vim.diagnostic.get(bufnr, { namespace = ns_id })
            vim.diagnostic.enable(false, { ns_id = ns_id, bufnr = bufnr })
            vim.diagnostic.reset(ns_id, bufnr)
            return
          end

          vim.diagnostic.enable(true, { ns_id = ns_id, bufnr = bufnr })
          local b = vim.api.nvim_get_current_buf()
          local cached = ruff_diag_cache[b]
          if cached and #cached > 0 then
            vim.diagnostic.set(ns_id, b, cached)
          end
        end,
      })
      :map("<leader>tr")
  end,
}
