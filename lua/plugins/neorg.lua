-- [nfnl] Compiled from fnl/plugins/neorg.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("neorg").setup({load = {["core.concealer"] = {}, ["core.defaults"] = {}, ["core.completion"] = {config = {engine = "nvim-cmp"}}}})
end
return {"nvim-neorg/neorg", config = _1_, ft = "norg", version = "*"}
