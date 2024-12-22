[{1 :Saghen/blink.compat
    :version "*"
    :opts {:impersonate_nvim_cmp true}}

 {1 :mikavilpas/blink-ripgrep.nvim}
 {1 :L3MON4D3/LuaSnip}

 {1 :Saghen/blink.cmp
  :lazy false 
  :dependecies [:rafamadriz/friendly-snippets 
                :PaterJason/cmp-conjure 
                :mikavilpas/blink-ripgrep.nvim
                {:L3MON4D3/LuaSnip {:version "v2.*"}}]
  :version "v0.*"

  :opts {:keymap {:preset :enter
                  :<Tab> [:select_next :fallback]}

         :appearance {:use_nvim_cmp_as_default true
                      :nerd_font_variant :mono}

         :completion {:ghost_text {:enabled true}}

         :snippets 
         {:expand (fn [snippet] 
                    (let [lsnip (require :luasnip)] 
                      (lsnip.lsp_expand snippet)))
          :active (fn [filter]
                    (let [lsnip (require :luasnip)]
                      (if (and filter filter.direction)
                        (lsnip.jumpable filter.direction)
                        (lsnip.in_snippet))))}

         :sources
         {:default [:lsp :path :snippets :buffer :conjure :ripgrep :luasnip]

          :cmdline {}

          :providers
          {:conjure
            {:name :conjure 
             :module :blink.compat.source}
           :ripgrep
            {:module :blink-ripgrep
             :name :Ripgrep}}}}

  :config (fn [_ opts]
           (let [blink (require :blink.cmp)]
	     (vim.cmd.highlight "BlinkCmpGhostText guifg=#393939")
             (blink.setup opts)))}]
