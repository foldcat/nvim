-- [nfnl] Compiled from fnl/plugins/error.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local tid = require("tiny-inline-diagnostic")
  vim.diagnostic.config({virtual_text = false})
  return tid.setup({virt_texts = {priority = 99999}})
end
return {"rachartier/tiny-inline-diagnostic.nvim", event = "LspAttach", priority = 1000, config = _1_, enabled = false}
