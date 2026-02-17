local servers = {
  "lua_ls",
  "stylua",
  -- "pyrefly",
  "basedpyright",
  "ruff",
}
return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = servers,
    })

    local severity = vim.diagnostic.severity
    vim.diagnostic.config({
      signs = {
        text = {
          [severity.ERROR] = " ",
          [severity.WARN] = " ",
          [severity.HINT] = "󰠠 ",
          [severity.INFO] = " ",
        },
      },
      virtual_lines = {
        format = function(diagnostic)
          return string.format("[%s] %s", diagnostic.source, diagnostic.message)
        end,
        current_line = true,
      },
    })
  end,
}
