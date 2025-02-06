{1 :rachartier/tiny-inline-diagnostic.nvim
   :enabled false
   :event :LspAttach
   :priority 1000
   :config 
   (fn []
     (let [tid (require :tiny-inline-diagnostic)]
       ;(set vim.opt.updatetime 100)
       (vim.diagnostic.config {:virtual_text false})
       (tid.setup {:virt_texts {:priority 99999}})))}
