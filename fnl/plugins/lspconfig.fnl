[{1 :williamboman/mason.nvim
    :opts {}}

 {1 :neovim/nvim-lspconfig
    :event [:BufRead :VeryLazy]
    :dependencies 
    [{1 :AstroNvim/astrolsp :opts {
        :config 
        {:fennel_language_server 
          {:settings 
            {:fennel 
              {:diagnostics 
              {:globals [:vim]
              :workspace 
              {:library (vim.api.nvim_list_runtime_paths)}}}}}}}}
       {1 :ionide/Ionide-vim}
       {1 :williamboman/mason-lspconfig.nvim
          :dependencies :williamboman/mason.nvim
          :opts 
          (fn []
           {:handlers 
             [(fn [server]
                (when (not= server :fsautocomplete) ; do NOT start this thing
                  ((. (require :astrolsp) :lsp_setup) server)))]})}]
    :config 
    (fn []
      (vim.tbl_map (. (require :astrolsp) :lsp_setup)
      (. (require :astrolsp) :config :servers))

      (let [astrolsp (require :astrolsp)]
        ((. (require :ionide) :setup)
         {:on_attach astrolsp.on_attach 
          :capabilities astrolsp.capabilities})

        ((. (require :lspconfig) :gleam :setup)
         {:on_attach astrolsp.on_attach
          :capabilities astrolsp.capabilities}))

      (local map vim.keymap.set)

      (map :n :gD vim.lsp.buf.declaration)
      (map :n :gd vim.lsp.buf.definition)
      (map :n :gi vim.lsp.buf.implementation)
      (map :n :<leader>sh vim.lsp.buf.signature_help)
      (map :n :<leader>wa vim.lsp.buf.add_workspace_folder)
      (map :n :<leader>wr vim.lsp.buf.remove_workspace_folder)
      (map :n :<leader>wl
           (fn []
             (print (vim.inspect (vim.lsp.buf.list_workspace_folders)))))
      (map :n :<leader>D vim.lsp.buf.type_definition)
      (map :n :<leader>ra vim.lsp.buf.rename)
      (map [:n :v] :<leader>ca vim.lsp.buf.code_action)
      (map :n :gr vim.lsp.buf.references))}]	
