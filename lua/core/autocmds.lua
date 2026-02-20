local function augroup(name)
  return vim.api.nvim_create_augroup("customAutocmds_" .. name, { clear = true })
end

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
