{1 :nvim-neorg/neorg
 :config 
 (fn []
   ((. (require :neorg) :setup) 
    {:load {:core.concealer {}
            :core.defaults {}
            :core.completion {:config {:engine :nvim-cmp} }}}))
 :lazy false
 :version "*"}
