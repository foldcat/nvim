{1 :rachartier/tiny-inline-diagnostic.nvim
   :enabled true
   :event :LspAttach
   :priority 1000
   :config 
   (fn []
     (let [tid (require :tiny-inline-diagnostic)]
       ;(set vim.opt.updatetime 100)
       (tid.setup {:virt_texts {:priority 99999}})))}
