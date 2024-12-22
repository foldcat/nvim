-- [nfnl] Compiled from fnl/plugins/blink.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(snippet)
  local lsnip = require("luasnip")
  return lsnip.lsp_expand(snippet)
end
local function _2_(filter)
  local lsnip = require("luasnip")
  if (filter and filter.direction) then
    return lsnip.jumpable(filter.direction)
  else
    return lsnip.in_snippet()
  end
end
local function _4_(_, opts)
  local blink = require("blink.cmp")
  vim.cmd.highlight("BlinkCmpGhostText guifg=#393939")
  return blink.setup(opts)
end
return {{"Saghen/blink.compat", version = "*", opts = {impersonate_nvim_cmp = true}}, {"mikavilpas/blink-ripgrep.nvim"}, {"L3MON4D3/LuaSnip"}, {"Saghen/blink.cmp", dependecies = {"rafamadriz/friendly-snippets", "PaterJason/cmp-conjure", "mikavilpas/blink-ripgrep.nvim", {["L3MON4D3/LuaSnip"] = {version = "v2.*"}}}, version = "v0.*", opts = {keymap = {preset = "enter", ["<Tab>"] = {"select_next", "fallback"}}, appearance = {use_nvim_cmp_as_default = true, nerd_font_variant = "mono"}, completion = {ghost_text = {enabled = true}}, snippets = {expand = _1_, active = _2_}, sources = {default = {"lsp", "path", "snippets", "buffer", "conjure", "ripgrep", "luasnip"}, cmdline = {}, providers = {conjure = {name = "conjure", module = "blink.compat.source"}, ripgrep = {module = "blink-ripgrep", name = "Ripgrep"}}}}, config = _4_, lazy = false}}