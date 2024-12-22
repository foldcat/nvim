-- [nfnl] Compiled from fnl/mappings.fnl by https://github.com/Olical/nfnl, do not edit.
local map = vim.keymap.set
local function _1_()
  vim.cmd("split")
  return vim.cmd("Oil")
end
vim.api.nvim_create_user_command("Sex", _1_, {desc = "Oil split open"})
local function _2_()
  vim.cmd("vsplit")
  return vim.cmd("Oil")
end
vim.api.nvim_create_user_command("Vex", _2_, {desc = "Oil vsplit open"})
local function _3_()
  return vim.cmd("Oil")
end
vim.api.nvim_create_user_command("Ex", _3_, {desc = "Oil open"})
map("n", ";", ":", {desc = "CMD enter command mode"})
map("n", "<Esc>", "<cmd>noh<cr>", {desc = "Clear highlight"})
map("n", "<leader>fn", ":Oil <CR>", {desc = "turn on netrw"})
local function _4_()
  local conform = require("conform")
  return conform.format({async = true, lsp_format = "fallback"})
end
map("n", "<leader>fm", _4_, {desc = "format buffer"})
local oil_open_3f = false
local function _5_()
  vim.cmd("Oil")
  oil_open_3f = true
  return nil
end
map("n", "<leader>e", _5_, {desc = "oil open parent directory"})
local function _6_()
  local oil = require("oil")
  if oil_open_3f then
    oil.close()
    oil_open_3f = false
    return nil
  else
    vim.cmd("Oil")
    oil_open_3f = true
    return nil
  end
end
return map("n", "<C-n>", _6_, {desc = "oil toggle"})
