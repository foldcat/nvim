{1 :scalameta/nvim-metals
 :config 
 (fn [self metals-config]
  (local nvim-metals-group
  (vim.api.nvim_create_augroup :nvim-metals {:clear true}))
  (vim.api.nvim_create_autocmd :FileType
  {:callback (fn []
               ((. (require :metals)
                   :initialize_or_attach) metals-config))
   :group nvim-metals-group
   :pattern self.ft}))
   :dependencies [:nvim-lua/plenary.nvim
                  :neovim/nvim-lspconfig]
   :ft [:scala :sbt :java]
   :opts 
   (fn []
     (local metals-config ((. (require :metals) :bare_config)))
     (fn metals-config.on_attach [client bufnr]
      (let [astrolsp (require :astrolsp)]
        (astrolsp.on_attach client bufnr)))
     metals-config)}	
