{1 :altermo/ultimate-autopair.nvim
   :enabled true
   :event :InsertEnter
   :init 
   (fn []
     (let [autop (require :ultimate-autopair)]
       (autop.setup {})))}
