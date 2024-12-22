-- [nfnl] Compiled from fnl/plugins/tabby.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local tabby = require("tabby")
  vim.o.showtabline = 2
  local theme = {current_tab = "TabLineSel", fill = "TabLineFill", head = "TabLine", tab = "TabLine", tail = "TabLine", win = "TabLine"}
  local function _2_(line)
    local function _3_(tab)
      local hl = ((tab.is_current() and theme.current_tab) or theme.tab)
      return {line.sep("", hl, theme.fill), ((tab.is_current() and "*") or "o"), tab.number(), tab.name(), tab.close_btn("x"), line.sep("", hl, theme.fill), hl = hl, margin = " "}
    end
    local function _4_(win)
      return {line.sep("", theme.win, theme.fill), ((win.is_current() and "*") or "o"), win.buf_name(), line.sep("", theme.win, theme.fill), hl = theme.win, margin = " "}
    end
    return {{{"", hl = theme.head}, line.sep("", theme.head, theme.fill)}, line.tabs().foreach(_3_), line.spacer(), line.wins_in_tab(line.api.get_current_tab()).foreach(_4_), {line.sep("", theme.tail, theme.fill), {" ", hl = theme.tail}}, hl = theme.fill}
  end
  return tabby.setup({line = _2_})
end
return {"nanozuki/tabby.nvim", event = "VeryLazy", keys = {{"<leader>ta", "<cmd>:$tabnew<cr>"}, {"<leader>tc", "<cmd>:tabclose<cr>"}, {"<leader>to", "<cmd>:tabonly<cr>"}, {"<leader>tn", "<cmd>:tabn<cr>"}, {"<leader>tp", "<cmd>:tabp<cr>"}, {"<leader>tmp", ":-tabmove<cr>"}, {"<leader>tmn", ":+tabmove<cr>"}}, config = _1_}
