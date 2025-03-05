-- [nfnl] Compiled from fnl/plugins/colorscheme.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  require("catppuccin").setup({color_overrides = {mocha = {base = "#000000", crust = "#000000", mantle = "#000000"}}, integrations = {telescope = {enabled = true, style = "nvchad"}}, no_italic = true, flavour = "mocha", styles = {booleans = {}, comments = {}, conditionals = {}, functions = {}, keywords = {}, loops = {}, numbers = {}, properties = {}, strings = {}, types = {}, variables = {}}, term_colors = true, transparent_background = false})
  return vim.cmd.colorscheme("catppuccin")
end
return {{"nyoom-engineering/oxocarbon.nvim", priority = 1000, lazy = false}, {"rebelot/kanagawa.nvim", priority = 1000, lazy = false}, {"catppuccin/nvim", priority = 1000, config = _1_, lazy = false}, {"dgox16/oldworld.nvim", priority = 1000, lazy = false}, {"drewxs/ash.nvim", priority = 1000, lazy = false}, {"jackplus-xyz/binary.nvim", priority = 1000, opts = {style = "dark"}, lazy = false}}
