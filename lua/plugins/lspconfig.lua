-- [nfnl] Compiled from fnl/plugins/lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local function _2_(server)
    if (server ~= "fsautocomplete") then
      return require("astrolsp").lsp_setup(server)
    else
      return nil
    end
  end
  return {handlers = {_2_}}
end
local function _4_()
  vim.tbl_map(require("astrolsp").lsp_setup, require("astrolsp").config.servers)
  do
    local astrolsp = require("astrolsp")
    require("ionide").setup({on_attach = astrolsp.on_attach, capabilities = astrolsp.capabilities})
    require("lspconfig").gleam.setup({on_attach = astrolsp.on_attach, capabilities = astrolsp.capabilities})
  end
  local map = vim.keymap.set
  map("n", "gD", vim.lsp.buf.declaration)
  map("n", "gd", vim.lsp.buf.definition)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "<leader>sh", vim.lsp.buf.signature_help)
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
  local function _5_()
    return print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end
  map("n", "<leader>wl", _5_)
  map("n", "<leader>D", vim.lsp.buf.type_definition)
  map("n", "<leader>ra", vim.lsp.buf.rename)
  map({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action)
  return map("n", "gr", vim.lsp.buf.references)
end
return {{"williamboman/mason.nvim", opts = {}}, {"neovim/nvim-lspconfig", event = {"BufRead", "VeryLazy"}, dependencies = {{"AstroNvim/astrolsp", opts = {config = {fennel_language_server = {settings = {fennel = {diagnostics = {globals = {"vim"}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}}}}}}, {"ionide/Ionide-vim"}, {"williamboman/mason-lspconfig.nvim", dependencies = "williamboman/mason.nvim", opts = _1_}}, config = _4_}}
