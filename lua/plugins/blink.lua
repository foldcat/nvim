-- [nfnl] Compiled from fnl/plugins/blink.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local blink = require("blink.cmp")
  vim.cmd.highlight("BlinkCmpGhostText guifg=#393939")
  return blink.setup(opts)
end
return {{"Saghen/blink.compat", version = "*", opts = {impersonate_nvim_cmp = true}}, {"mikavilpas/blink-ripgrep.nvim"}, {"L3MON4D3/LuaSnip"}, {"Saghen/blink.cmp", dependecies = {"rafamadriz/friendly-snippets", "PaterJason/cmp-conjure", "mikavilpas/blink-ripgrep.nvim", {["L3MON4D3/LuaSnip"] = {version = "v2.*"}}}, version = "v0.*", opts = {keymap = {preset = "enter", ["<Tab>"] = {"select_next", "fallback"}}, appearance = {use_nvim_cmp_as_default = true, nerd_font_variant = "mono"}, completion = {ghost_text = {enabled = true}, menu = {draw = {columns = {{"label", "label_description", gap = 1}, {"kind"}}}}}, snippets = {preset = "luasnip"}, cmdline = {enabled = false}, sources = {default = {"lsp", "path", "snippets", "buffer", "conjure", "ripgrep", "neorg"}, providers = {conjure = {name = "conjure", module = "blink.compat.source"}, neorg = {name = "neorg", module = "blink.compat.source"}, ripgrep = {module = "blink-ripgrep", name = "Ripgrep"}}}}, config = _1_, lazy = false}}
