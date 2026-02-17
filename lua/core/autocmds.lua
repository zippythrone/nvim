local function augroup(name)
  return vim.api.nvim_create_augroup("customAutocmds_" .. name, { clear = true })
end

-- Save cursor position before yanking
local cursorPreYank

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yank and restore cursor",
  group = augroup("highlight-restore-yank"),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
    if vim.v.event.operator == "y" and cursorPreYank then
      vim.api.nvim_win_set_cursor(0, cursorPreYank)
    end
  end,
})

-- local function toggle_ruff_diagnostics(bufnr)
--   bufnr = bufnr or 0
--
--   for ns_id, ns in pairs(vim.diagnostic.get_namespaces()) do
--     if type(ns.name) == "string" and ns.name:match("^vim%.lsp%.ruff") and ns.name:match("%.Ruff$") then
--       local enabled = vim.diagnostic.is_enabled({
--         ns_id = ns_id,
--         bufnr = bufnr,
--       })
--
--       vim.diagnostic.enable(not enabled, {
--         ns_id = ns_id,
--         bufnr = bufnr,
--       })
--
--       vim.notify(("Ruff diagnostics %s"):format(enabled and "disabled" or "enabled"), vim.log.levels.INFO)
--       return
--     end
--   end
--
--   vim.notify("Ruff diagnostics namespace not found", vim.log.levels.WARN)
-- end
--
-- vim.keymap.set("n", "<leader>ur", function()
--   toggle_ruff_diagnostics(0)
-- end, { desc = "Toggle Ruff diagnostics" })
--
--
