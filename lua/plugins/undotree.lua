-- [nfnl] Compiled from fnl/plugins/undotree.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local utree = require("undotree")
  return utree.toggle()
end
return {"jiaoshijie/undotree", dependencies = "nvim-lua/plenary.nvim", keys = {{"<leader>u", _1_}}}
