{1 :nvim-treesitter/nvim-treesitter
   :event :BufRead
   :config
   (fn []
     (let [ts (require :nvim-treesitter.configs)]
         (ts.setup 
          {:ensure_installed [:lua :luadoc :printf :vim :vimdoc :fennel :odin]
           :highlight {:enable true
                       :use_languagetree true}
           :indent {:enable true}})))}
