-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.g["conjure#log#hud#enabled"] = false
  return nil
end
return {"PaterJason/cmp-conjure", ft = {"fennel"}, dependencies = {"Olical/conjure", ft = {"clojure", "fennel", "python"}, init = _1_}}
