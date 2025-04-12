;{1 :nvimdev/indentmini.nvim
;   :event :BufReadPre
;   :opts {}
;   :config (fn [opt] 
;            (vim.cmd.highlight "IndentLineCurrent guifg=#262626")
;            (vim.cmd.highlight "IndentLine guifg=#393939")
;            (let [indentmini (require :indentmini)]
;             (indentmini.setup opt)))}
{1 :lukas-reineke/indent-blankline.nvim
   :main :ibl 
   :lazy false
   :opts {:scope {:enabled false}}}
