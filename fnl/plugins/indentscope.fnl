{1 :nvimdev/indentmini.nvim
   :event :BufReadPre
   :opts {}
   :config (fn [opt] 
            (vim.cmd.highlight "IndentLineCurrent guifg=#262626")
            (vim.cmd.highlight "IndentLine guifg=#393939")
            (let [indentmini (require :indentmini)]
             (indentmini.setup opt)))}
