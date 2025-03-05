-- [nfnl] Compiled from fnl/plugins/heirline.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local hline = require("heirline")
  local conditions = require("heirline.conditions")
  local utils = require("heirline.utils")
  local colors = {blue = utils.get_highlight("Function").fg, bright_bg = utils.get_highlight("Folded").bg, normal_bg = utils.get_highlight("StatusLine").bg, bright_fg = utils.get_highlight("Folded").fg, cyan = utils.get_highlight("Special").fg, dark_red = utils.get_highlight("DiffDelete").bg, diag_error = utils.get_highlight("DiagnosticError").fg, diag_hint = utils.get_highlight("DiagnosticHint").fg, diag_info = utils.get_highlight("DiagnosticInfo").fg, diag_warn = utils.get_highlight("DiagnosticWarn").fg, git_add = utils.get_highlight("diffAdded").fg, git_change = utils.get_highlight("diffChanged").fg, git_del = utils.get_highlight("diffDeleted").fg, gray = utils.get_highlight("NonText").fg, green = utils.get_highlight("String").fg, orange = utils.get_highlight("Constant").fg, purple = utils.get_highlight("Statement").fg, red = utils.get_highlight("DiagnosticError").fg}
  hline.load_colors(colors)
  local Vi_mode
  local function _2_(self)
    self.mode = vim.fn.mode(1)
    return nil
  end
  local function _3_()
    return vim.cmd("redrawstatus", "pattern", "*:*")
  end
  local function _4_(self)
    return ("%2(" .. self.mode .. "%)")
  end
  local function _5_(self)
    local mode = self.mode:sub(1, 1)
    return {bold = true, fg = self.mode_colors[mode], bg = "normal_bg"}
  end
  Vi_mode = {init = _2_, static = {mode_colors = {["\19"] = "purple", ["\22"] = "red", ["!"] = "red", R = "orange", S = "purple", V = "cyan", c = "orange", i = "green", n = "red", r = "orange", s = "purple", t = "red", v = "cyan"}}, update = {"ModeChanged", callback = vim.schedule_wrap(_3_)}, provider = _4_, hl = _5_}
  local File_name_block
  local function _6_(self)
    self.filename = vim.api.nvim_buf_get_name(0)
    return nil
  end
  File_name_block = {init = _6_, hl = {bg = "normal_bg"}}
  local File_name
  local function _7_(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if (filename == "") then
      return "[No Name]"
    else
    end
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    else
    end
    return filename
  end
  File_name = {hl = {fg = "orange"}, provider = _7_}
  local File_flags
  local function _10_()
    return vim.bo.modified
  end
  local function _11_()
    return (not vim.bo.modifiable or vim.bo.readonly)
  end
  File_flags = {{condition = _10_, hl = {fg = "green", bg = "normal_bg"}, provider = " [+]"}, {condition = _11_, hl = {fg = "pink", bg = "normal_bg"}, provider = " [x]"}}
  local File_name_modifer
  local function _12_()
    if vim.bo.modified then
      return {bold = true, fg = "red", force = true, bg = "normal_bg"}
    else
      return nil
    end
  end
  File_name_modifer = {hl = _12_}
  File_name_block = utils.insert(File_name_block, utils.insert(File_name_modifer, File_name), File_flags, {provider = "%<"})
  local LSPActive
  local function _14_()
    local names = {}
    for _, server in pairs(vim.lsp.get_clients({bufnr = 0})) do
      table.insert(names, server.name)
    end
    return ("[" .. table.concat(names, " ") .. "]")
  end
  LSPActive = {condition = conditions.lsp_attached, hl = {bold = true, fg = "green", bg = "normal_bg"}, provider = _14_, update = {"LspAttach", "LspDetach"}}
  local Git
  local function _15_(self)
    return self.status_dict.head
  end
  local function _16_(self)
    return self.has_changes
  end
  local function _17_(self)
    local count = (self.status_dict.added or 0)
    return ((count > 0) and ("+" .. count))
  end
  local function _18_(self)
    local count = (self.status_dict.removed or 0)
    return ((count > 0) and ("-" .. count))
  end
  local function _19_(self)
    local count = (self.status_dict.changed or 0)
    return ((count > 0) and ("~" .. count))
  end
  local function _20_(self)
    return self.has_changes
  end
  local function _21_(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = (((self.status_dict.added ~= 0) or (self.status_dict.removed ~= 0)) or (self.status_dict.changed ~= 0))
    return nil
  end
  Git = {{hl = {bold = true, bg = "normal_bg"}, provider = _15_}, {condition = _16_, provider = "("}, {hl = {fg = "purple", bg = "normal_bg"}, provider = _17_}, {hl = {fg = "red", bg = "normal_bg"}, provider = _18_}, {hl = {fg = "blue", bg = "normal_bg"}, provider = _19_}, {condition = _20_, provider = ")"}, condition = conditions.is_git_repo, hl = {fg = "orange", bg = "normal_bg"}, init = _21_}
  local Scroll_bar
  local function _22_(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = (math.floor((((curr_line - 1) / lines) * #self.sbar)) + 1)
    return string.rep(self.sbar[i], 2)
  end
  Scroll_bar = {hl = {bg = "bright_bg", fg = "purple"}, provider = _22_, static = {sbar = {"\226\150\129", "\226\150\130", "\226\150\131", "\226\150\132", "\226\150\133", "\226\150\134", "\226\150\135", "\226\150\136"}}}
  local Ruler = {provider = "%7(%l/%3L%):%2c %P"}
  local Align = {provider = "%="}
  local Space = {provider = " "}
  local statusline = {Vi_mode, Space, File_name_block, Space, LSPActive, Align, Git, Space, Ruler}
  return hline.setup({statusline = statusline})
end
return {"rebelot/heirline.nvim", event = "VeryLazy", config = _1_}
