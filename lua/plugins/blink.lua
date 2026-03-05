local blink = {
  "saghen/blink.cmp",
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "none",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },

      ["<CR>"] = { "accept", "fallback" },

      ["<Up>"] = { "scroll_documentation_up", "fallback" },
      ["<Down>"] = { "scroll_documentation_down", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { auto_show = true },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
      },
    },
    sources = {
      default = { "lsp", "path", "buffer" },
    },

    fuzzy = {
      implementation = "rust",
      sorts = {
        "exact",
        "score",
        "sort_text",
      },
    },
  },
  opts_extend = { "sources.default" },
}
return blink
