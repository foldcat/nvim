-- [nfnl] Compiled from fnl/plugins/neorg.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local neorg = require("neorg")
  return neorg.setup({})
end
return {"nvim-neorg/neorg", version = "*", config = _1_, lazy = false}
