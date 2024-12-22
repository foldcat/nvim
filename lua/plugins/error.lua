-- [nfnl] Compiled from fnl/plugins/error.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local tid = require("tiny-inline-diagnostic")
  return tid.setup()
end
return {"rachartier/tiny-inline-diagnostic.nvim", enabled = true, event = "LspAttach", priority = 1000, config = _1_}
