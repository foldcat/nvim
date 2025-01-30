-- [nfnl] Compiled from fnl/plugins/colorscheme.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return vim.cmd.colorscheme("ash")
end
return {{"nyoom-engineering/oxocarbon.nvim", priority = 1000, lazy = false}, {"dgox16/oldworld.nvim", priority = 1000, lazy = false}, {"drewxs/ash.nvim", priority = 1000, config = _1_, lazy = false}, {"jackplus-xyz/binary.nvim", priority = 1000, opts = {style = "dark"}, lazy = false}}
