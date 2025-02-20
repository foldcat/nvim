-- [nfnl] Compiled from fnl/plugins/metals.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(self, metals_config)
  local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", {clear = true})
  local function _2_()
    return require("metals").initialize_or_attach(metals_config)
  end
  return vim.api.nvim_create_autocmd("FileType", {callback = _2_, group = nvim_metals_group, pattern = self.ft})
end
local function _3_()
  local metals_config = require("metals").bare_config()
  metals_config.on_attach = function(client, bufnr)
    local astrolsp = require("astrolsp")
    return astrolsp.on_attach(client, bufnr)
  end
  return metals_config
end
return {"scalameta/nvim-metals", config = _1_, dependencies = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}, ft = {"scala", "sbt", "java"}, opts = _3_}
