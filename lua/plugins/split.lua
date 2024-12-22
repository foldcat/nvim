-- [nfnl] Compiled from fnl/plugins/split.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local split = require("smart-splits")
  return split.resize_left()
end
local function _2_()
  local split = require("smart-splits")
  return split.resize_down()
end
local function _3_()
  local split = require("smart-splits")
  return split.resize_up()
end
local function _4_()
  local split = require("smart-splits")
  return split.resize_right()
end
local function _5_()
  local split = require("smart-splits")
  return split.move_cursor_left()
end
local function _6_()
  local split = require("smart-splits")
  return split.move_cursor_down()
end
local function _7_()
  local split = require("smart-splits")
  return split.move_cursor_up()
end
local function _8_()
  local split = require("smart-splits")
  return split.move_cursor_right()
end
local function _9_()
  local split = require("smart-splits")
  return split.swap_buf_left()
end
local function _10_()
  local split = require("smart-splits")
  return split.swap_buf_down()
end
local function _11_()
  local split = require("smart-splits")
  return split.swap_buf_up()
end
local function _12_()
  local split = require("smart-splits")
  return split.swap_buf_right()
end
return {"mrjones2014/smart-splits.nvim", keys = {{"<A-h>", _1_}, {"<A-j>", _2_}, {"<A-k>", _3_}, {"<A-l>", _4_}, {"<C-h>", _5_}, {"<C-j>", _6_}, {"<C-k>", _7_}, {"<C-l>", _8_}, {"<leader><leader>h", _9_}, {"<leader><leader>j", _10_}, {"<leader><leader>k", _11_}, {"<leader><leader>l", _12_}}, opts = {}}
