return {
  {
    "nvim-mini/mini.splitjoin",
    version = false,
    keys = { "gs" },
    opts = {
      mappings = {
        toggle = "gs",
      },
    },
  },
  {
    "nvim-mini/mini.pairs",
    version = false,
    event = "InsertEnter",
    opts = {},
  },
}
