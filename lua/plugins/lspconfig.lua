-- [nfnl] Compiled from fnl/plugins/lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local function _2_(server)
    return require("astrolsp").lsp_setup(server)
  end
  return {handlers = {_2_}}
end
local function _3_()
  vim.tbl_map(require("astrolsp").lsp_setup, require("astrolsp").config.servers)
  local map = vim.keymap.set
  map("n", "gD", vim.lsp.buf.declaration)
  map("n", "gd", vim.lsp.buf.definition)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "<leader>sh", vim.lsp.buf.signature_help)
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
  local function _4_()
    return print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end
  map("n", "<leader>wl", _4_)
  map("n", "<leader>D", vim.lsp.buf.type_definition)
  map("n", "<leader>ra", vim.lsp.buf.rename)
  map({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action)
  return map("n", "gr", vim.lsp.buf.references)
end
return {{"williamboman/mason.nvim", opts = {}}, {"neovim/nvim-lspconfig", event = {"BufRead", "VeryLazy"}, dependencies = {{"AstroNvim/astrolsp", opts = {config = {fennel_language_server = {settings = {fennel = {diagnostics = {globals = {"vim"}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}}}}}}, {"williamboman/mason-lspconfig.nvim", dependencies = "williamboman/mason.nvim", opts = _1_}}, config = _3_}}
