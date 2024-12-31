local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.wo.number = true

local lazy_config = require("configs.lazy")

require("lazy").setup({
  {"Olical/nfnl", ft="fennel"},
  { import = "plugins" },
}, {
    defaults = {lazy = true},
    ui = {
      icons = {
      cmd = "cmd ",
      config = "cfg",
      event = "event ",
      favorite = "fav ",
      ft = "ft ",
      init = "init ",
      import = "import ",
      keys = "keys ",
      lazy = " ",
      loaded = "*",
      not_loaded = "o",
      plugin = "plugin ",
      runtime = "rt ",
      require = "req ",
      source = "src ",
      start = "start ",
      task = "task ",
      list = {
        "*",
        ">",
        "#",
        "-",
      }},}
  })

vim.schedule(function()
	require("init")
end)
