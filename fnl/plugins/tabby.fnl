;vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
;vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
;vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
;vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
;vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
;-- move current tab to previous position
;vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
;-- move current tab to next position
;vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

{1 :nanozuki/tabby.nvim
   :event :VeryLazy

   :keys 
   [[:<leader>ta "<cmd>:$tabnew<cr>"]
    [:<leader>tc "<cmd>:tabclose<cr>"]
    [:<leader>to "<cmd>:tabonly<cr>"]
    [:<leader>tn "<cmd>:tabn<cr>"]
    [:<leader>tp "<cmd>:tabp<cr>"]
    [:<leader>tmp ":-tabmove<cr>"]
    [:<leader>tmn ":+tabmove<cr>"]]

   :config 
   (fn []
     (let [tabby (require :tabby)]
       (set vim.o.showtabline 2)
       (local theme 
        {:current_tab :TabLineSel
         :fill :TabLineFill
         :head :TabLine
         :tab :TabLine
         :tail :TabLine
         :win :TabLine})
       	(tabby.setup 
          {:line (fn [line]
                  {1 [{1 "" :hl theme.head}
                      (line.sep "" theme.head theme.fill)]
                   2 ((. (line.tabs) :foreach) (fn [tab]
                                                  (local hl
                                                         (or (and (tab.is_current)
                                                                  theme.current_tab)
                                                          theme.tab))
                                                  {1 (line.sep ""
                                                               hl
                                                               theme.fill)
                                                   2 (or (and (tab.is_current)
                                                              "*")
                                                      "o")
                                                   3 (tab.number)
                                                   4 (tab.name)
                                                   5 (tab.close_btn "x")
                                                   6 (line.sep ""
                                                               hl
                                                               theme.fill)
                                                     : hl
                                                     :margin " "}))
                     3 (line.spacer)
                     4 ((. (line.wins_in_tab (line.api.get_current_tab))
                         :foreach) (fn [win]
                                    {1 (line.sep ""
                                                 theme.win
                                                 theme.fill)
                                       2 (or (and (win.is_current)
                                              "*")
                                          "o")
                                       3 (win.buf_name)
                                       4 (line.sep ""
                                                   theme.win
                                                   theme.fill)
                                         :hl theme.win
                                         :margin " "}))
                     5 [(line.sep "" theme.tail theme.fill)
                        {1 " " :hl theme.tail}]
                     :hl theme.fill})})))}
