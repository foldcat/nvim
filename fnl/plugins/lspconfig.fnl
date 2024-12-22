[{1 :williamboman/mason.nvim
    :opts {}}

 {1 :neovim/nvim-lspconfig
    :event [:BufRead :VeryLazy]
    :dependencies 
    [{1 :AstroNvim/astrolsp :opts {}}
     {1 :williamboman/mason-lspconfig.nvim
        :dependencies :williamboman/mason.nvim
        :opts 
        (fn []
         {:handlers 
           [(fn [server]
            ((. (require :astrolsp) :lsp_setup) server))]})}]
    :config 
    (fn []
      (vim.tbl_map (. (require :astrolsp) :lsp_setup)
      (. (require :astrolsp) :config :servers)))}]	
