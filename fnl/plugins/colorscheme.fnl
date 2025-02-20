[{1 :nyoom-engineering/oxocarbon.nvim
    :lazy false
    :priority 1000} 

 {1 :dgox16/oldworld.nvim
    :priority 1000 
    :lazy false
    :config 
    (fn []
      ((. (require :oldworld) :setup)
       {:variant :oled})
      (vim.cmd.colorscheme :oldworld))}

 {1 :drewxs/ash.nvim
    :lazy false 
    :priority 1000}

 {1 :jackplus-xyz/binary.nvim
    :lazy false 
    :priority 1000
    :opts {:style :dark}}]
