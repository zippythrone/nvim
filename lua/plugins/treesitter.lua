return {
  "MeanderingProgrammer/treesitter-modules.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  ---@module 'treesitter-modules'
  ---@type ts.mod.UserConfig
  opts = {
    ensure_installed = { "lua", },
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
}
