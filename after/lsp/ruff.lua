return {
  init_options = {
    settings = {
      lint = { enable = true },
    },
  },

  ---@diagnostic disable-next-line: unused-local
  on_attach = function(client, _bufnr)
    client.server_capabilities.hoverProvider = false
  end,
}
