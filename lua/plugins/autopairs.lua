-- [nfnl] Compiled from fnl/plugins/autopairs.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local autop = require("ultimate-autopair")
  return autop.setup({})
end
return {"altermo/ultimate-autopair.nvim", enabled = true, event = "InsertEnter", init = _1_}
