[{1 :nyoom-engineering/oxocarbon.nvim
    :lazy false
    :priority 1000} 

 {1 :rebelot/kanagawa.nvim
    :lazy false 
    :priority 1000}

 {1 :Shatur/neovim-ayu
    :lazy false 
    :priority 1000}

 {1 :catppuccin/nvim
    :lazy false 
    :priority 1000 
    :config 
    (fn []
      ((. (require :catppuccin) :setup)
        {:color_overrides {:mocha {:base "#000000"
                                  :crust "#000000"
                                  :mantle "#000000"}}
        :integrations {:telescope {:enabled true :style :nvchad}}
        :no_italic true
        :flavour :mocha
        :styles {:booleans {}
                 :comments {}
                 :conditionals {}
                 :functions {}
                 :keywords {}
                 :loops {}
                 :numbers {}
                 :properties {}
                 :strings {}
                 :types {}
                 :variables {}}
        :term_colors true
        :transparent_background false})
      (vim.cmd.colorscheme :catppuccin))}

 {1 :dgox16/oldworld.nvim
    :priority 1000 
    :lazy false}

 {1 :drewxs/ash.nvim
    :lazy false 
    :priority 1000}

 {1 :jackplus-xyz/binary.nvim
    :lazy false 
    :priority 1000
    :opts {:style :dark}}]
