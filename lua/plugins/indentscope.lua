-- [nfnl] Compiled from fnl/plugins/indentscope.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(opt)
  vim.cmd.highlight("IndentLineCurrent guifg=#262626")
  vim.cmd.highlight("IndentLine guifg=#393939")
  local indentmini = require("indentmini")
  return indentmini.setup(opt)
end
return {"nvimdev/indentmini.nvim", event = "BufReadPre", opts = {}, config = _1_}
