-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local ts = require("nvim-treesitter.configs")
  return ts.setup({ensure_installed = {"lua", "luadoc", "printf", "vim", "vimdoc", "fennel", "odin"}, highlight = {enable = true, use_languagetree = true}, indent = {enable = true}})
end
return {"nvim-treesitter/nvim-treesitter", config = _1_}
