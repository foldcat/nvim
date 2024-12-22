{1 :PaterJason/cmp-conjure
   :ft [:fennel]
   :dependencies 
   {1 :Olical/conjure
    :ft [:clojure :fennel :python]
    :init 
    (fn [] 
      (tset vim.g "conjure#log#hud#enabled" false))}}
