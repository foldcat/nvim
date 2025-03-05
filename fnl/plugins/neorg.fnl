{1 :nvim-neorg/neorg
   :lazy false
   :version :* 
   :config 
   (fn []
     (let [neorg (require :neorg)]
       (neorg.setup
         {})))}
