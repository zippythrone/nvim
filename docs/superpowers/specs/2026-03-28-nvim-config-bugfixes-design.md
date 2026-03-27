# Nvim Config Bugfixes

Minimal fixes for 7 issues identified during config review. No new features.

## Fixes

### 1. Remove `stylua` from mason-lspconfig servers
**File:** `lua/plugins/lsp.lua`
**Problem:** `stylua` is a formatter, not an LSP server. `mason-lspconfig` only handles LSP servers.
**Fix:** Remove `"stylua"` from the `servers` list. It's already available via Mason for conform.nvim.

### 2. Clean up tabout.lua
**File:** `lua/plugins/tabout.lua`
**Problem:** File defines both `neotab` and `tabout` but returns `neotab`. The `tabout` block is dead code with stale packer.nvim options (`opt = true`).
**Fix:** Delete the `tabout` variable and its entire definition (lines 9-42). Keep only the `neotab` spec.

### 3. Fix `<leader>qq` description
**File:** `lua/core/keymaps.lua`
**Problem:** Desc says "Quit all (without save)" but `:qa` prompts on unsaved changes (it doesn't force-quit).
**Fix:** Change desc to `"Quit all"`.

### 4. Remove no-op `linebreak` option
**File:** `lua/core/options.lua`
**Problem:** `vim.opt.linebreak = true` has no effect when `wrap = false`.
**Fix:** Delete the line.

### 5. Replace polling timer with event-driven checktime
**File:** `lua/core/autocmds.lua`
**Problem:** A `uv.new_timer` polls `checktime` every 500ms, running even when Neovim is idle/backgrounded.
**Fix:** Replace with autocmd on `FocusGained`, `TermClose`, `TermLeave` events. Fires only when returning to Neovim.

```lua
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})
```

### 6. Delete dead basedpyright config
**File:** `after/lsp/basedpyright.lua`
**Problem:** Returns `{}` with 18 lines of commented-out config. Basedpyright was replaced by pyrefly.
**Fix:** Delete the file.

### 7. Remove commented-out window navigation
**File:** `lua/core/keymaps.lua`
**Problem:** Commented-out `<C-h/j/k/l>` window nav (lines 8-12), replaced by vim-tmux-navigator.
**Fix:** Delete the commented block.

## Scope

- 5 files modified, 1 file deleted
- No new features, no new dependencies
- All changes are deletions or one-line edits
