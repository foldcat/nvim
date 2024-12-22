-- [nfnl] Compiled from fnl/plugins/lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local function _2_(server)
    return require("astrolsp").lsp_setup(server)
  end
  return {handlers = {_2_}}
end
local function _3_()
  return vim.tbl_map(require("astrolsp").lsp_setup, require("astrolsp").config.servers)
end
return {{"williamboman/mason.nvim", opts = {}}, {"neovim/nvim-lspconfig", event = {"BufRead", "VeryLazy"}, dependencies = {{"AstroNvim/astrolsp", opts = {}}, {"williamboman/mason-lspconfig.nvim", dependencies = "williamboman/mason.nvim", opts = _1_}}, config = _3_}}
