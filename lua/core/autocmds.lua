local function augroup(name)
  return vim.api.nvim_create_augroup("customAutocmds_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yank and restore cursor",
  group = augroup("highlight-restore-yank"),
  callback = function()
    vim.hl.on_yank({ timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("<leader>cr", vim.lsp.buf.rename, "Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("<leader>cl", "<cmd> LspInfo <CR>", "Lsp Info")
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "OilActionsPost",
  callback = function(event)
      if event.data.actions[1].type == "move" then
          Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
      end
  end,
})
