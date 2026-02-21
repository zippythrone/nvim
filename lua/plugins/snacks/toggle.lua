local M = {}

function M.setup()
  local Snacks = require("snacks")

  Snacks.toggle.indent():map("<leader>tg")
  Snacks.toggle.diagnostics():map("<leader>td")
  Snacks.toggle.treesitter():map("<leader>th")
  Snacks.toggle.line_number():map("<leader>tl")
  Snacks.toggle.animate():map("<leader>ta")

  Snacks.toggle({
    name = "Hardtime",
    get = function()
      local ok, ht = pcall(require, "hardtime")
      return ok and ht.is_plugin_enabled or false
    end,
    set = function(state)
      local ok, ht = pcall(require, "hardtime")
      if not ok then
        return
      end
      if state then
        ht.enable()
      else
        ht.disable()
      end
    end,
  }):map("<leader>tH")
end

return M
